
-- -- Create an autocommand group
-- local tfvars_group = vim.api.nvim_create_augroup('tfvars', {clear = true})

-- -- Create an autocommand to set the filetype to hcl for .tfvars files
-- vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
--   pattern = '*.tfvars',
--   group = tfvars_group,
--   command = 'setlocal filetype=hcl'
-- })

-- Create an autocommand group
local jenkins_group = vim.api.nvim_create_augroup('tfvars', {clear = true})

-- Create an autocommand to set the filetype to hcl for .tfvars files
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
  pattern = 'Jenkinsfile',
  group = jenkins_group,
  command = 'setlocal filetype=groovy'
})


-- Create an autocommand group
local toml_group = vim.api.nvim_create_augroup('tfvars', {clear = true})

-- Create an autocommand to set the filetype to hcl for .tfvars files
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
  pattern = {'pycodestyle', '.pylintrc'},
  group = toml_group,
  command = 'setlocal filetype=toml'
})



  -- Fixes file type recognition for certain files
  -- EVAL: May or Maynot be a thing in lvim 
  -- vim.cmd [[
  --     autocmd FileType markdown set conceallevel=0
  --     autocmd FileType markdown normal zR

  --     autocmd BufNewFile,BufRead Jenkinsfile setfiletype groovy
  --     autocmd BufNewFile,BufRead pycodestyle setfiletype toml
  --     autocmd BufNewFile,BufRead .pylintrc setfiletype toml
  -- ]]


-- -- Autocommand to set format options when buffer window is entered.
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     -- Setting format options
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })

-- -- Autocommand for file types.
-- -- It sets key mappings and options for specific file types.
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = {
--     "Jaq",
--     "qf",
--     "help",
--     "man",
--     "lspinfo",
--     "spectre_panel",
--     "lir",
--     "DressingSelect",
--     "tsplayground",
--     "",
--   },
--   callback = function()
--     -- Set key mappings and options for the buffer
--     vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR>
--       " nnoremap <silent> <buffer> <esc> :close<CR>
--       set nobuflisted
--     ]]
--   end,
-- })

-- -- Another autocommand for Jaq file type.
-- vim.api.nvim_create_autocmd({ "FileType" }, {
--   pattern = { "Jaq" },
--   callback = function()
--     -- Set additional key mappings for Jaq file type
--     vim.cmd [[
--       nnoremap <silent> <buffer> <m-r> :close<CR>
--       " nnoremap <silent> <buffer> <m-r> <NOP>
--       set nobuflisted
--     ]]
--   end,
-- })

-- -- Autocommand for entering a buffer.
-- -- It sets key mappings if the file type of the buffer is empty.
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufEnter" }, {
--   pattern = { "*" },
--   callback = function()
--     local buf_ft = vim.bo.filetype
--     if buf_ft == "" or buf_ft == nil then
--       -- Set key mappings and options for the buffer
--       vim.cmd [[
--       nnoremap <silent> <buffer> q :close<CR>
--       " nnoremap <silent> <buffer> <c-j> j<CR>
--       " nnoremap <silent> <buffer> <c-k> k<CR>
--       set nobuflisted
--     ]]
--     end
--   end,
-- })

-- -- Autocommand to set titlestring when entering a buffer.
-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
--   pattern = { "" },
--   callback = function()
--     local get_project_dir = function()
--       local cwd = vim.fn.getcwd()
--       local project_dir = vim.split(cwd, "/")
--       local project_name = project_dir[#project_dir]
--       return project_name
--     end
--     vim.opt.titlestring = get_project_dir()
--   end,
-- })

-- -- Many more autocommands follow, each with their own triggers, patterns, and callbacks...
-- -- ...

-- -- Autocommand for when Vim is resized.
-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   callback = function()
--     -- Equalize window sizes after Vim is resized
--     vim.cmd "tabdo wincmd ="
--   end,
-- })

-- -- ...

-- -- Autocommand for entering terminal mode.
-- vim.api.nvim_create_autocmd({ "TermEnter" }, {
--   pattern = { "*" },
--   callback = function()
--     -- Start insert mode in terminal
--     vim.cmd "startinsert"
--   end,
-- })

-- -- ...

-- -- Autocommand for CursorHold event.
-- vim.api.nvim_create_autocmd({ "CursorHold" }, {
--   callback = function()
--     local status_ok, luasnip = pcall(require, "luasnip")
--     if not status_ok then
--       return
--     end
--     if luasnip.expand_or_jumpable() then
--       -- Unlink current snippet if expandable or jumpable
--       vim.cmd [[silent! lua require("luasnip").unlink_current()]]
--     end
--   end,
-- })

-- -- ...

-- -- Autocommand when LSP attaches.
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     -- Perform actions with the LSP client
--     -- ...
--   end,
-- })
