M = {}

-- A private utility function to copy the given path to the clipboard and notify the user.
local function copy(path)
    -- Copy the provided path to the system clipboard.
    vim.fn.setreg("+", path)
    -- Notify the user with a message indicating the path has been copied.
    vim.notify('Copied "' .. path .. '" to the clipboard!')
end

-- Function to copy the full path of the currently opened file in Neovim to the clipboard.
M.fullPath = function()
    copy(vim.fn.expand("%:p"))
end

-- Function to retrieve and copy the relative path of the currently opened file in Neovim.
M.relativePath = function()
    -- Source: https://www.reddit.com/r/neovim/comments/q2s3t1/how_to_get_current_filename_relative_to_project/
    -- Use Vimscript functions to retrieve the relative path of the current file.
    copy(vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:."))
end

-- Function to copy only the name of the current file in Neovim (without directory path).
M.fileName = function()
    copy(vim.fn.expand("%:t"))
end

-- Return the module to make the functions accessible when this module is imported elsewhere.
return M
