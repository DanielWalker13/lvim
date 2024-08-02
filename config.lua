--
reload("user.autocmd") -- Not Working
vim.loader.enable()

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



-- Here for troubleshooting
-- -------------------- Treesitter --------------------


-- lvim.builtin.treesitter.ignore_install = { "haskell" }
-- lvim.builtin.treesitter.highlight = {
--   enable = true,
--   additional_vim_regex_highlighting = false
-- }

-- lvim.builtin.treesitter.autotag.enable = true
-- lvim.builtin.treesitter.context_commentstring.enable = true
-- lvim.builtin.treesitter.playground = {
--   enable = true,
--   disable = {},
--   updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
--   persist_queries = false, -- Whether the query persists across vim sessions
-- }

-- lvim.builtin.treesitter.ensure_installed = {
--   "bash",
--   "c",
--   "css",
--   "cmake",
--   "comment",
--   "css",
--   "csv",
--   "dockerfile",
--   "gitignore",
--   "go",
--   "graphql",
--   "html",
--   "hcl",
--   "helm",
--   "ini",
--   "java",
--   "javascript",
--   "jsdoc",
--   "json",
--   "lua",
--   "make",
--   "markdown",
--   "markdown_inline",
--   "pem",
--   "php",
--   "python",
--   "pem",
--   "rego",
--   "tcl",
--   "tmux",
--   "tsx",
--   "typescript",
--   "regex",
--   "ruby",
--   "rust",
--   "sql",
--   "swift",
--   "terraform",
--   "toml",
--   "typescript",
--   "vim",
--   "vimdoc",
--   "xml",
--   "yaml",
-- }


-- local present, treesitter_context = pcall(require, "treesitter-context")
-- if not present then
--   return
-- end

-- treesitter_context.setup({
--   enable = true,         -- Enable this plugin (Can be enabled/disabled later via commands)
--   max_lines = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
--   trim_scope = "outer",  -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
--   patterns = {           -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
--     default = {
--       "class",
--       "function",
--       "method",
--       "for",
--       "while",
--       "if",
--       "switch",
--       "case",
--     },
--     tex = {
--       "chapter",
--       "section",
--       "subsection",
--       "subsubsection",
--     },
--     rust = {
--       "impl_item",
--       "struct",
--       "enum",
--     },
--     scala = {
--       "object_definition",
--     },
--     vhdl = {
--       "process_statement",
--       "architecture_body",
--       "entity_declaration",
--     },
--     markdown = {
--       "section",
--     },
--     elixir = {
--       "anonymous_function",
--       "arguments",
--       "block",
--       "do_block",
--       "list",
--       "map",
--       "tuple",
--       "quoted_content",
--     },
--     json = {
--       "pair",
--     },
--     yaml = {
--       "block_mapping_pair",
--     },
--   },
--   exact_patterns = {
--     rust = true,
--   },
--   zindex = 20,     -- The Z-index of the context window
--   mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
--   separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
-- })
