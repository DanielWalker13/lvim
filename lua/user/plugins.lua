-- Create readme for unused potential plugins / config
lvim.plugins = {
  { "ThePrimeagen/harpoon" },        -- Lazy load when a buffer is read
  { "folke/todo-comments.nvim" },    -- Load when entering a window
  { "tpope/vim-repeat" },            -- Load when entering insert mode
  {
    "tpope/vim-fugitive",            -- Load when the :G command is used
    { "vim-scripts/IndexedSearch" }, -- Load when entering command-line mode
    { "psliwka/vim-smoothie" },
    event = "VimEnter"
  },                                                                      -- Load after Neovim starts
  { "mbbill/undotree",                          cmd = "UndotreeToggle" }, -- Load when the :UndotreeToggle command is used
  { "axiaoxin/vim-json-line-format",            ft = "json" },            -- Load when a JSON file is opened
  { "godlygeek/tabular",                        cmd = "Tabularize" },     -- Load when the :Tabularize command is used
  { "github/copilot.vim" },                                               -- Load when entering insert mode
  { "kylechui/nvim-surround" },                                           -- Load when a buffer is read
  { "folke/trouble.nvim" },                                               -- Load when the :TroubleToggle command is used
  -- { "nvim-telescope/telescope-live-grep-args.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
}


-------------------- Potential Core Plugin Addition --------------------

-- Do more research on these plugins and consider adding them to the core plugins

-- Rooter plugin
-- {
--   "airblade/vim-rooter",
--   config = function()
--     -- Configure rooter to use `pyproject.toml` as a root indicator
--     vim.g.rooter_patterns = { 'pyproject.toml', '.git', 'Makefile', 'package.json' }
--     vim.g.rooter_manual_only = 0 -- Manual mode, toggle with :RooterToggle
--     -- Enable debugging
--     vim.g.rooter_debug = 1
--   end,
--   event = "BufEnter",
-- },



------------------ harpoon --------------------

local present, harpoon = pcall(require, "harpoon")
if not present then
  return
end

harpoon.setup({
  global_settings = {
    save_on_toggle = false,             -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_change = true,              -- saves the harpoon file upon every change. disabling is unrecommended.
    enter_on_sendcmd = false,           -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    tmux_autoclose_windows = false,     -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    excluded_filetypes = { "harpoon" }, -- filetypes that you want to prevent from adding to the harpoon list menu.
    mark_branch = true,                 -- set marks specific to each git branch inside git repository
  },
})


-------------------- TODO --------------------

local present, todo = pcall(require, "todo-comments")
if not present then
  return
end

local task_configs = {
  signs = true,      -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = {
      icon = ' ',
      color = 'error',                            -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
    },
    TODO = { icon = ' ', color = 'todo' },
    UPGR = { icon = ' ', color = 'upgrade', alt = { 'UPGRADE', 'RESEARCH' } },
    WARN = { icon = ' ', color = 'warning', alt = { 'WARNING' } },
    PERF = { icon = ' ', color = 'perf', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
    NOTE = { icon = ' ', color = 'note', alt = { 'INFO', 'DOCUMENT', 'OPTION' } },
    TEST = { icon = ' ', color = 'test', alt = { 'TESTING', 'PASSED', 'ACTIVE', 'GOOD', 'FAILED' } },
    EVAL = { icon = ' ', color = 'eval', alt = { 'OK', 'BEST', 'FEATURE', 'REVIEW' } },
  },
  gui_style = {
    fg = 'NONE', -- The gui style to use for the fg highlight group.
    bg = 'BOLD', -- The gui style to use for the bg highlight group.
  },

  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
  highlight = {
    multiline = true,                -- enable multine todo comments
    multiline_pattern = '^.',        -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10,          -- extra lines that will be re-evaluated when changing a line
    before = '',                     -- 'fg' or 'bg' or empty
    keyword = 'wide',                -- 'fg', 'bg', 'wide', 'wide_bg', 'wide_fg' or empty.
    after = 'fg',                    -- 'fg' or 'bg' or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true,            -- uses treesitter to match keywords in comments only
    max_line_len = 400,              -- ignore lines longer than this
    exclude = {},                    -- list of file types to exclude highlighting
  },
  colors = {
    todo = { 'TasksToDo', '#00AEDB' },
    upgrade = { 'Upgrade', '#FFBf00' },
    perf = { 'Performance', '#2389DA' },
    note = { 'DiagnosticHint', '#ACE1AF' },
    default = { 'Identifier', '#7C3AED' },
    test = { 'Test Me', '#0BB159' },
    eval = { 'Evaluate', '#5D5D5D' },
    info = { 'DiagnosticInfo', '#2563EB' },
    warning = { 'DiagnosticWarning', '#DC6900' },
    error = { 'DiagnosticError', 'ErrorMsg', '#D11141' }
  },
  search = {
    command = 'rg',
    args = {
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
    },
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
  },
}

require('todo-comments').setup(task_configs)


-------------------- Trouble --------------------

local present, trouble = pcall(require, "trouble")
if not present then
  return
end

trouble.setup({
  position = "bottom", -- position of the list can be: bottom, top, left, right
  height = 15, -- height of the trouble list when position is top or bottom
  width = 85, -- width of the list when position is left or right
  icons = true, -- use devicons for filenames
  mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
  fold_open = "", -- icon used for open folds
  fold_closed = "", -- icon used for closed folds
  group = true, -- group results by file
  padding = true, -- add an extra new line on top of the list
  action_keys = { -- key mappings for actions in the trouble list
    close = "q", -- close the list
    cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
    refresh = "r", -- manually refresh

    jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
    open_split = { "<c-x>" }, -- open buffer in new split
    open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
    open_tab = { "<c-t>" }, -- open buffer in new tab
    jump_close = { "o" }, -- jump to the diagnostic and close the list
    toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
    toggle_preview = "P", -- toggle auto_preview
    hover = "K", -- opens a small popup with the full multiline message
    preview = "p", -- preview the diagnostic location
    close_folds = { "zM", "zm" }, -- close all folds
    open_folds = { "zR", "zr" }, -- open all folds
    toggle_fold = { "zA", "za" }, -- toggle fold of current file
    previous = "k", -- preview item
    next = "j", -- next item
  },
  indent_lines = true, -- add an indent guide below the fold icons
  auto_open = false, -- automatically open the list when you have diagnostics
  auto_close = true, -- automatically close the list when you have no diagnostics
  auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
  auto_fold = false, -- automatically fold a file trouble list at creation
  auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠",
  },
  use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})
