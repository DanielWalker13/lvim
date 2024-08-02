--
-- vim.loader.enable()

-- local function reload(module)
--   package.loaded[module] = nil
--   require(module)
-- end


require("user.builtin_settings")
reload("user.plugins")
reload("user.cmd")     -- Working
reload("user.lib")
reload("user.lsp")     -- Working
reload("user.maps")    -- Working
reload("user.options") -- Issue with saving lua files
reload("user.autocmd") -- Not Working


-- Function to check and print if a file is loaded
-- function checkFileLoaded(filename)
--   if vim.g['loaded_' .. filename] then
--     print(filename .. ' has been loaded.')
--   else
--     print(filename .. ' has not been loaded.')
--   end
-- end

-- checkFileLoaded('./lua/user/lib/maps.lua')
