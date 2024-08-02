-- -- Create an autocommand group
-- local tfvars_group = vim.api.nvim_create_augroup('tfvars', {clear = true})

-- -- Create an autocommand to set the filetype to hcl for .tfvars files
-- vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
--   pattern = '*.tfvars',
--   group = tfvars_group,
--   command = 'setlocal filetype=hcl'
-- })

-- Create an autocommand group
local jenkins_group = vim.api.nvim_create_augroup('tfvars', { clear = true })

-- Create an autocommand to set the filetype to hcl for .tfvars files
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
  pattern = 'Jenkinsfile',
  group = jenkins_group,
  command = 'setlocal filetype=groovy'
})


-- Create an autocommand group
local toml_group = vim.api.nvim_create_augroup('tfvars', { clear = true })

-- Create an autocommand to set the filetype to hcl for .tfvars files
vim.api.nvim_create_autocmd('BufRead,BufNewFile', {
  pattern = { 'pycodestyle', '.pylintrc' },
  group = toml_group,
  command = 'setlocal filetype=toml'
})


-- Enable Treesitter highlight module
lvim.builtin.treesitter.highlight.enabled = true

-- Create autocommand groups
vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })
vim.api.nvim_create_augroup("FileTypeOverrides", { clear = true })

-- Autocommand for Markdown settings
vim.api.nvim_create_autocmd("FileType", {
  group = "MarkdownSettings",
  pattern = "markdown",
  callback = function()
    vim.opt.conceallevel = 0
    vim.cmd("normal! zR")
    vim.cmd("syntax enable")
  end,
})

-- Autocommands for specific file types
vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  group = "FileTypeOverrides",
  pattern = "Jenkinsfile",
  command = "setfiletype groovy",
})
vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  group = "FileTypeOverrides",
  pattern = "pycodestyle",
  command = "setfiletype toml",
})
vim.api.nvim_create_autocmd("BufNewFile,BufRead", {
  group = "FileTypeOverrides",
  pattern = ".pylintrc",
  command = "setfiletype toml",
})
