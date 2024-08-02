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
  },                                                                         -- Load after Neovim starts
  { "mbbill/undotree",                             cmd = "UndotreeToggle" }, -- Load when the :UndotreeToggle command is used
  { "axiaoxin/vim-json-line-format",               ft = "json" },            -- Load when a JSON file is opened
  { "godlygeek/tabular",                           cmd = "Tabularize" },     -- Load when the :Tabularize command is used
  { "github/copilot.vim" },                                                  -- Load when entering insert mode
  { "kylechui/nvim-surround" },                                              -- Load when a buffer is read
  { "folke/trouble.nvim" },                                                  -- Load when the :TroubleToggle command is used
  { "nvim-telescope/telescope-live-grep-args.nvim" },
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


-------------------- Alpha --------------------

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"

-------------------- Copilot --------------------

local present, copilot = pcall(require, "copilot")
if not present then
  return
end

-- FIX: These setup settings seem to do not get respected
copilot.setup({
  plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
  cmp = {
    enabled = true,
    method = "getCompletionsCycling",
  },
  panel = {
    enabled = false,
    auto_refresh = false,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-y>",
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<C-f>",
      next = "<C-n>",
      prev = "<C-p>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = "node", -- Node.js version must be > 16.x
  server_opts_overrides = {},
})

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

-------------------- Mason --------------------
lvim.builtin.mason.ensure_installed = {
  "prettier",
}

-------------------- Nvim Tree --------------------

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- TODO: Eval: not created by me
--
-- lvim.builtin.nvimtree.setup.view.width = 50
-- lvim.builtin.nvimtree.setup.open_on_setup = false

-- -------------------- Telescope --------------------

local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.layout_config.preview_cutoff = 75
lvim.builtin.telescope.defaults.initial_mode = "insert"
lvim.builtin.telescope.pickers.find_files.previewer = nil

lvim.builtin.telescope.defaults.mappings = {
  i = {
    ["<C-n>"] = actions.cycle_history_next,
    ["<C-p>"] = actions.cycle_history_prev,
    ["<C-j>"] = actions.move_selection_next,
    ["<C-k>"] = actions.move_selectionprevious,
    ["<C-c>"] = actions.close,
    ["<Down>"] = actions.move_selection_next,
    ["<Up>"] = actions.move_selectionprevious,
    ["<CR>"] = actions.select_default,
    ["<C-x>"] = actions.select_horizontal,
    ["<C-v>"] = actions.select_vertical,
    ["<C-t>"] = actions.select_tab,
    ["<C-u>"] = actions.preview_scrolling_up,
    ["<C-d>"] = actions.preview_scrolling_down,
    ["<PageUp>"] = actions.results_scrolling_up,
    ["<PageDown>"] = actions.results_scrolling_down,
    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
    ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    ["<C-l>"] = actions.complete_tag,
    ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
  },

  n = {
    ["<esc>"] = actions.close,
    ["<CR>"] = actions.select_default,
    ["<C-x>"] = actions.select_horizontal,
    ["<C-v>"] = actions.select_vertical,
    ["<C-t>"] = actions.select_tab,
    ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
    ["<S-Tab>"] = actions.toggle_selection + actions.move_selectionbetter,
    ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
    ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
    ["j"] = actions.move_selection_next,
    ["k"] = actions.move_selectionprevious,
    ["H"] = actions.move_to_top,
    ["M"] = actions.move_to_middle,
    ["L"] = actions.move_to_bottom,
    ["<Down>"] = actions.move_selection_next,
    ["<Up>"] = actions.move_selectionprevious,
    ["gg"] = actions.move_totop,
    ["G"] = actions.move_tobottom,
    ["<C-u>"] = actions.preview_scrolling_up,
    ["<C-d>"] = actions.preview_scrollingdown,
    ["<PageUp>"] = actions.results_scrollingup,
    ["<PageDown>"] = actions.results_scrollingdown,
    ["?"] = actions.which_key,
  },
}


lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "ui-select")
  pcall(telescope.load_extension, "live_grep_args")
end

lvim.builtin.telescope.extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_cursor({}),
  },
  live_grep_args = {
    auto_quoting = true, -- enable/disable auto-quoting
    mappings = {         -- extend mappings
      i = {
        ["<C-k>"] = require('telescope-live-grep-args.actions').quote_prompt(),
        ["<C-i>"] = require('telescope-live-grep-args.actions').quote_prompt({ postfix = " --iglob " }),
      },
    },
  },
}


-- lvim.builtin.telescope.on_config_done = function(telescope)
--   pcall(telescope.load_extension, "ui-select")
-- end

-- lvim.builtin.telescope.extensions = {
--   ["ui-select"] = {
--     require("telescope.themes").get_cursor({}),
--   },
-- }


-------------------- Terminal --------------------

lvim.builtin.terminal.active = true

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

-------------------- Treesitter --------------------


lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight = {
  enable = true,
  additional_vim_regex_highlighting = false
}

lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.context_commentstring.enable = true
lvim.builtin.treesitter.playground = {
  enable = true,
  disable = {},
  updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
  persist_queries = false, -- Whether the query persists across vim sessions
}

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "css",
  "cmake",
  "comment",
  "css",
  "csv",
  "dockerfile",
  "gitignore",
  "go",
  "graphql",
  "html",
  "hcl",
  "helm",
  "ini",
  "java",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "pem",
  "php",
  "python",
  "pem",
  "rego",
  "tcl",
  "tmux",
  "tsx",
  "typescript",
  "regex",
  "ruby",
  "rust",
  "pydoc",
  "sql",
  "swift",
  "terraform",
  "toml",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
}


local present, treesitter_context = pcall(require, "treesitter-context")
if not present then
  return
end

treesitter_context.setup({
  enable = true,         -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0,         -- How many lines the window should span. Values <= 0 mean no limit.
  trim_scope = "outer",  -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  patterns = {           -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
    default = {
      "class",
      "function",
      "method",
      "for",
      "while",
      "if",
      "switch",
      "case",
    },
    tex = {
      "chapter",
      "section",
      "subsection",
      "subsubsection",
    },
    rust = {
      "impl_item",
      "struct",
      "enum",
    },
    scala = {
      "object_definition",
    },
    vhdl = {
      "process_statement",
      "architecture_body",
      "entity_declaration",
    },
    markdown = {
      "section",
    },
    elixir = {
      "anonymous_function",
      "arguments",
      "block",
      "do_block",
      "list",
      "map",
      "tuple",
      "quoted_content",
    },
    json = {
      "pair",
    },
    yaml = {
      "block_mapping_pair",
    },
  },
  exact_patterns = {
    rust = true,
  },
  zindex = 20,     -- The Z-index of the context window
  mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
  separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
})

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

-------------------- Which Key --------------------

WhichKeyIgnoreLabel = "which_key_ignore"

lvim.builtin.which_key.setup = {
  plugins = {
    marks = true,       -- shows a list of your marks on ' and `
    registers = true,   -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,  -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 50, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true,    -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true,      -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true,      -- default bindings on <c-w>
      nav = true,          -- misc bindings to work with windows
      z = true,            -- bindings for folds, spelling and others prefixed with z
      g = true,            -- bindings for prefixed with g
    },
  },
  operators = { gc = "Comments" },
  key_labels = {
    ["<space>"] = "space",
    ["<cr>"] = "enter",
    ["<tab>"] = "tab",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = 'j', -- binding to scroll down inside the popup
    scroll_up = 'k',   -- binding to scroll up inside the popup
  },
  window = {
    border = "none",          -- none, single, double, shadow
    position = "bottom",      -- bottom, top
    margin = { 0, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },                                             -- min and max height of the columns
    width = { min = 20, max = 50 },                                             -- min and max width of the columns
    spacing = 3,                                                                -- spacing between columns
    align = "center",                                                           -- align columns left, center or right
  },
  ignore_missing = false,                                                       -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true,                                                             -- show help message on the command line when the popup is visible
  show_keys = true,                                                             -- show the currently pressed key and its label as a message in the command line
  triggers = "auto",                                                            -- automatically setup triggers
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  disable = {
    buftypes = {},
    filetypes = { "TelescopePrompt" },
  },
}
