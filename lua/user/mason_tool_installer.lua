local present, mason_tool_installer = pcall(require, "mason-tool-installer")
if not present then
  return
end

mason_tool_installer.setup({
  ensure_installed = {
    -- You can pin a tool to a particular version
    -- { 'golangci-lint', version = 'v1.47.0' },

    -- You can turn off/on auto_update per tool
    -- { 'bash-language-server', auto_update = true },

    'air',
    'black',
    'codespell',
    'deno',
    'eslint-lsp',
    'gopls',
    'isort',
    'json-lsp',
    'jsonlint',
    'lua-language-server',
    "prettier",
    'stylua',
    'pydocstyle',
    'shellcheck',
    'eslint_d',
    "typescript-language-server",
    'vim-language-server',

    -- 'editorconfig-checker',
    -- 'gofumpt',
    -- 'golines',
    -- 'gomodifytags',
    -- 'gotests',
    -- 'impl',
    -- 'json-to-struct',
    'luacheck',
    -- 'misspell',
    -- 'revive',
    -- 'shfmt',
    -- 'staticcheck',
    -- 'vint',
  },

  auto_update = false, -- Default: false
  run_on_start = true, -- Default: true
  start_delay = 3000,  -- 3-second delay
  debounce_hours = 5,  -- At least 5 hours between attempts to install/update

  integrations = {
    ['mason-lspconfig'] = true,
    ['mason-null-ls'] = true,
    ['mason-nvim-dap'] = true,
  },
})
