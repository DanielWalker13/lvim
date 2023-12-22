-- Print name of  current file when opening for troubleshooting
-- Get the current file name
local current_file = vim.fn.expand('%:t')

-- Print the current file name
print('Current file name: ' .. current_file)


-- Easy way to map keys
-- Found better way more native to lvim
local M = {}

function M.map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

return M


-- NOTE: example
-- map('n', 'j', 'gj', { desc = 'Motion works with wrap on seperate line' })
