-- Early: make sure Mason bin is in PATH
local mason_path = vim.fn.stdpath("data") .. "/mason/bin"
if not string.find(vim.env.PATH, mason_path, 1, true) then
  vim.env.PATH = mason_path .. ":" .. vim.env.PATH
end

-- Load user modules
reload("user.options")
reload("user.builtin_settings")
reload("user.plugins")
reload("user.cmd")
reload("user.lib")
reload("user.lsp")
reload("user.maps")
reload("user.autocmd")
reload("user.mason_tool_installer")

-- Load Mason update and repair logic
local mason_update = require("user.mason_update")

-- Bootstrap Mason on first launch only
mason_update.bootstrap_mason_if_needed()
-- Sync tools if mason install list was modified
mason_update.sync_tools_if_config_changed()


vim.defer_fn(function()
  mason_update.repair_broken_packages()
end, 2000)
