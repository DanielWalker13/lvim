

local function ensure_mason_updated()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/mason/registry/github/mason-org/mason-registry"

  if fn.empty(fn.glob(install_path)) > 0 then
    vim.schedule(function()
      vim.cmd("MasonUpdate")
    end)
  end
end

local function check_mason_registry()
  local fn = vim.fn
  local registry_path = fn.stdpath("data") .. "/mason/registries/github/mason-org/mason-registry"

  -- Check if the registry is missing
  if fn.empty(fn.glob(registry_path)) > 0 then
    print("Mason registry not found. Running MasonUpdate...")
    vim.schedule(function()
      vim.cmd("MasonUpdate")
    end)
  end
end

local function list_registry_files()
  local fn = vim.fn
  local registry_path = fn.stdpath("data") .. "/mason/registries/github.com/mason-org/mason-registry"
  print("Registry path: " .. registry_path)
  print("Files in registry path:")
  print(fn.glob(registry_path .. "/*"))
end

return {
  ensure_mason_updated = ensure_mason_updated,
  check_mason_registry = check_mason_registry
  -- list_registry_files = list_registry_files
}


