-- reload("user.autocmd") -- Not Working
reload("user.cmd")     -- Working
reload("user.lib")
reload("user.lsp")     -- Working
reload("user.maps")    -- Working
reload("user.options") -- Issue with saving lua files
reload("user.plugins") -- Working

-- Function to check and print if a file is loaded
-- function checkFileLoaded(filename)
--     if vim.g['loaded_' .. filename] then
--         print(filename .. ' has been loaded.')
--     else
--         print(filename .. ' has not been loaded.')
--     end
-- end

-- checkFileLoaded('./lua/user/lib/general.lua')
