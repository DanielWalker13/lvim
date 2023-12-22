-- ============================================================================
--  Base Settings
-- ============================================================================

-- testing
-- lvim.builtin.search.indexed_search_mappings = false


-- Enable filetype plugins
vim.cmd [[
      filetype plugin on
      filetype indent on
  ]]

-- Restores cursor to last position
vim.cmd [[
      autocmd BufReadPost *
           \ if line("'\"") > 0 && line("'\"") <= line("$") |
           \   exe "normal! g`\"" |
           \ endif

  ]]

-- RESEARCH: Deep dive on this optin vs autocmd above
-- Command below did not work when tested
-- vim.opt.viminfo = "'10000,\"10000" -- Returns cursor to last position

-- EVAL: Should I move packer_compled file?
-- Relocate Packer Compiled File
-- vim.g.packer_compiled_path = '~/.packer_compiled.lua'
--

-- General Options
lvim.leader = "\\"                     -- Set leader key
lvim.log.level = "warn"                -- Set log level
vim.opt.syntax = "on"                  -- Syntax highlight on
vim.opt.syntax = "markdown"            --
vim.opt.encoding = "utf-8"             -- Enforces standard encoding
vim.opt.clipboard = "unnamed"          -- Copy to clipboard
vim.opt.number = true                  -- Show line numbers
vim.opt.spr = true                     -- Forces split to the right
vim.opt.backspace = "indent,eol,start" -- Backspace like normal
vim.opt.incsearch = true               -- Incremental search
vim.opt.hlsearch = true                -- Highlighted search results
vim.opt.undofile = true                -- Persistent undos after you re-open the file
vim.opt.hidden = true                  -- Keeps buffers open in the background
vim.opt.termguicolors = true           -- Enables highlight groups
vim.opt.signcolumn = "auto"            -- Enable Sign Column
vim.autoindent = true                  -- Carries current indent to next line
vim.cmd("set noswapfile")              -- Disables swap files
vim.opt.wrap = true                    -- Enable text wrapping

vim.opt.wildmode = 'list:longest'
vim.opt.shiftwidth = 2        -- Set indentation is 2 spaces
vim.opt.tabstop = 2           -- Set tab to 2 spaces
vim.opt.softtabstop = 2       -- Set tab to 2 spaces
vim.opt.expandtab = true      -- Converts tabs to spaces

vim.opt.relativenumber = true -- Enables relative numbers in sign column
vim.opt.timeoutlen = 3000     -- Set time to input after leader kye is pressed
vim.opt.scrolloff = 8         -- Pading between top/bottom screen for scroll

lvim.colorscheme = "lunar"
lvim.transparent_window = true

-- NOTE: Not created by Me
-- Evaluate
-- vim.opt.sidescrolloff = 24

-- vim.opt.foldmethod = "indent"
-- vim.opt.foldlevel = 14
vim.opt.cursorline = true -- Highlights current line background


vim.g.python3_host_prog = '~/.asdf/shims/python'

-- NOTE: Not Set by Me
-- EVAL: I had this set to false
-- I'll leave it that way for now
-- lvim.format_on_save.enabled = false
lvim.format_on_save.enabled = true

-- Disable lir
lvim.builtin.lir.active = false
