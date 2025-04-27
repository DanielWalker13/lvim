local uv = vim.loop
local M = {}

function M.bootstrap_mason_if_needed()
  local fn = vim.fn
  local registry_path = fn.stdpath("data") .. "/mason/registries/github/mason-org/mason-registry"

  if fn.empty(fn.glob(registry_path)) > 0 then
    vim.notify("[Mason Bootstrap] Mason registry not found. Running MasonToolsUpdate...", vim.log.levels.WARN)
    vim.schedule(function()
      vim.cmd("MasonToolsUpdate")
    end)
  end
end

function M.sync_tools_if_config_changed()
  local config_path = vim.fn.stdpath("config") .. "/lua/user/mason_tool_installer.lua"
  local stamp_path = vim.fn.stdpath("data") .. "/mason/.mason_tool_installer_stamp"

  local function get_mtime(path)
    local stat = uv.fs_stat(path)
    return stat and stat.mtime.sec or 0
  end

  local config_mtime = get_mtime(config_path)
  local last_mtime = 0

  if vim.fn.filereadable(stamp_path) == 1 then
    local contents = vim.fn.readfile(stamp_path)
    if contents[1] then
      last_mtime = tonumber(contents[1]) or 0
    end
  end

  if config_mtime > last_mtime then
    vim.notify("[Mason Sync] Config changed. Running MasonToolsUpdate...", vim.log.levels.INFO)
    vim.schedule(function()
      vim.cmd("MasonToolsUpdate")
    end)
    vim.fn.writefile({ tostring(config_mtime) }, stamp_path)
  end
end

function M.repair_broken_packages()
  local mason_data = vim.fn.stdpath("data") .. "/mason/"
  local packages_path = mason_data .. "packages/"
  local staging_path = mason_data .. "staging/"
  local bin_path = mason_data .. "bin/"
  local mr = require("mason-registry")

  -- Get directory entries
  local function get_dir_entries(path)
    local entries = {}
    local handle = uv.fs_scandir(path)
    if handle then
      while true do
        local name, type = uv.fs_scandir_next(handle)
        if not name then break end
        entries[#entries + 1] = { name = name, type = type }
      end
    end
    return entries
  end

  -- Check if the package has a bin folder with any files
  local function package_has_simple_bin(tool)
    local bin_dir = packages_path .. tool .. "/bin/"
    local entries = get_dir_entries(bin_dir)
    return entries and #entries > 0
  end

  -- Check if a symlink exists for the tool
  local function has_symlink(tool)
    local symlink = bin_path .. tool
    return uv.fs_stat(symlink) ~= nil
  end

  -- Check if a staging (partial install) file exists
  local function has_staging(tool)
    local staged_file = staging_path .. tool
    return uv.fs_stat(staged_file) ~= nil
  end

  local packages = get_dir_entries(packages_path)
  if not packages then
    vim.notify("[Mason Repair] No installed packages found.", vim.log.levels.WARN)
    return
  end

  local repaired = 0
  local total = 0

  for _, entry in ipairs(packages) do
    local tool = entry.name
    total = total + 1

    local staging_exists = has_staging(tool)
    local symlink_exists = has_symlink(tool)
    local bin_exists = package_has_simple_bin(tool)

    local broken = false

    if staging_exists then
      broken = true
    elseif not symlink_exists and not bin_exists then
      broken = true
    end

    if broken then
      vim.notify("[Mason Repair] Reinstalling broken package: " .. tool, vim.log.levels.WARN)

      local ok, pkg = pcall(mr.get_package, tool)
      if ok and pkg then
        pkg:uninstall()
        vim.defer_fn(function()
          pkg:install()
        end, 1000)
        repaired = repaired + 1
      else
        vim.notify("[Mason Repair] Cannot find registry info for " .. tool, vim.log.levels.ERROR)
      end
    else
      vim.notify("[Mason Repair] " .. tool .. " is healthy.", vim.log.levels.DEBUG)
    end
  end

  vim.notify(string.format("[Mason Repair] Checked %d tools, repaired %d.", total, repaired), vim.log.levels.INFO)
end

return M
