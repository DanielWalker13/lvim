--
-- reload("user.autocmd") -- Not Working
-- vim.loader.enable()

local function reload(module)
  package.loaded[module] = nil
  require(module)
end


reload("user.cmd")     -- Working
reload("user.lib")
reload("user.lsp")     -- Working
reload("user.maps")    -- Working
reload("user.plugins")
reload("user.options") -- Issue with saving lua files


-- Function to check and print if a file is loaded
-- function checkFileLoaded(filename)
--     if vim.g['loaded_' .. filename] then
--         print(filename .. ' has been loaded.')
--     else
--         print(filename .. ' has not been loaded.')
--     end
-- end

-- checkFileLoaded('./lua/user/lib/general.lua')
