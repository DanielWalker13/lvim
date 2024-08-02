-------------------------------------------------------
-- Built-in Settings
-------------------------------------------------------

-------------------- Alpha --------------------

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"



-------------------- Mason --------------------
lvim.builtin.mason.ensure_installed = {
  "prettier",
}

-------------------- Nvim Tree --------------------

lvim.builtin.nvimtree.setup.hijack_netrw = true
lvim.builtin.nvimtree.setup.hijack_directories = {
  enable = true,
  auto_open = true,
}
lvim.builtin.nvimtree.setup.update_cwd = true
lvim.builtin.nvimtree.setup.view = {
  width = 30,
  side = 'right', -- Open nvim-tree on the right side
}
lvim.builtin.nvimtree.setup.actions = {
  open_file = {
    quit_on_open = true, -- Closes the tree when you open a file
  },
}
-- lvim.builtin.nvimtree.setup.git = {
--   enable = false, -- Disable Git integration
-- }
lvim.builtin.nvimtree.setup.renderer = {
  icons = {
    show = {
      git = false, -- Don't show Git icons
    },
  },
}

-- -------------------- Telescope --------------------

-- local _, actions = pcall(require, "telescope.actions")

lvim.builtin.telescope.defaults.layout_config.width = 0.95
lvim.builtin.telescope.defaults.initial_mode = "insert"

-- lvim.builtin.telescope.defaults.mappings = {
--   i = {
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-c>"] = actions.close,
--     ["<Down>"] = actions.move_selection_next,
--     ["<Up>"] = actions.move_selection_previous,
--     ["<CR>"] = actions.select_default,
--     ["<C-x>"] = actions.select_horizontal,
--     ["<C-v>"] = actions.select_vertical,
--     ["<C-t>"] = actions.select_tab,
--     ["<C-u>"] = actions.preview_scrolling_up,
--     ["<C-d>"] = actions.preview_scrolling_down,
--     ["<PageUp>"] = actions.results_scrolling_up,
--     ["<PageDown>"] = actions.results_scrolling_down,
--     ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--     ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--     ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--     ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--     ["<C-l>"] = actions.complete_tag,
--     ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
--   },

--   n = {
--     ["<esc>"] = actions.close,
--     ["<CR>"] = actions.select_default,
--     ["<C-x>"] = actions.select_horizontal,
--     ["<C-v>"] = actions.select_vertical,
--     ["<C-t>"] = actions.select_tab,
--     ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
--     ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
--     ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
--     ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
--     ["j"] = actions.move_selection_next,
--     ["k"] = actions.move_selection_previous,
--     ["H"] = actions.move_to_top,
--     ["M"] = actions.move_to_middle,
--     ["L"] = actions.move_to_bottom,
--     ["<Down>"] = actions.move_selection_next,
--     ["<Up>"] = actions.move_selection_previous,
--     ["gg"] = actions.move_to_top,
--     ["G"] = actions.move_tobottom,
--     ["<C-u>"] = actions.preview_scrolling_up,
--     ["<C-d>"] = actions.preview_scrolling_down,
--     ["<PageUp>"] = actions.results_scrolling_up,
--     ["<PageDown>"] = actions.results_scrolling_down,
--     ["?"] = actions.which_key,
--   },
-- }


-- lvim.builtin.telescope.on_config_done = function(telescope)
--   pcall(telescope.load_extension, "ui-select")
--   pcall(telescope.load_extension, "live_grep_args")
-- end

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


lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "ui-select")
end

lvim.builtin.telescope.extensions = {
  ["ui-select"] = {
    require("telescope.themes").get_cursor({}),
  },
}


-------------------- Terminal --------------------

lvim.builtin.terminal.active = true

-------------------- Treesitter --------------------

lvim.builtin.treesitter.ignore_install = { "haskell", "markdown", "markdown_inline" }
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


-------------------- Which Key --------------------

-- WhichKeyIgnoreLabel = "which_key_ignore"

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



-- -------------------- Copilot --------------------

-- local present, copilot = pcall(require, "copilot")
-- if not present then
--   return
-- end

-- -- FIX: These setup settings seem to do not get respected
-- copilot.setup({
--   plugin_manager_path = get_runtime_dir() .. "/site/pack/packer",
--   cmp = {
--     enabled = true,
--     method = "getCompletionsCycling",
--   },
--   panel = {
--     enabled = false,
--     auto_refresh = false,
--     keymap = {
--       jump_prev = "[[",
--       jump_next = "]]",
--       accept = "<CR>",
--       refresh = "gr",
--       open = "<M-y>",
--     },
--   },
--   suggestion = {
--     enabled = true,
--     auto_trigger = true,
--     debounce = 75,
--     keymap = {
--       accept = "<C-f>",
--       next = "<C-n>",
--       prev = "<C-p>",
--       dismiss = "<C-]>",
--     },
--   },
--   filetypes = {
--     yaml = false,
--     lua = false,
--     markdown = false,
--     help = false,
--     gitcommit = false,
--     gitrebase = false,
--     hgcommit = false,
--     svn = false,
--     cvs = false,
--     ["."] = false,
--   },
--   copilot_node_command = "node", -- Node.js version must be > 16.x
--   server_opts_overrides = {},
-- })
