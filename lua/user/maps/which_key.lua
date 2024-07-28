-----------------------------------------------------------
-- Which Key
-----------------------------------------------------------

-- EVAL: Ensure unwanted commands don't show up in which key
-- Looking good: use for a while and then remove
-- Delay / <space> to instant open seems to work pretty good.

local groups = reload("user.maps.groups")

-- TODO:Whichkey list
-- Identify what neeed to be diabled or overwritten
-- Analyze all required functionallity
-- Create structure that incorporates features
--   - Must be extensible
--   - Must be logical
--   - Must have good pnumonics
--   - Analyze other peoples config for ideas
-- Start to implement

-- Instand menus bindings

vim.keymap.set('n', '<leader><space>', ':WhichKey <leader><CR>', { desc = 'Which Key: View Options' })

vim.keymap.set('n', 'v<space>', ':WhichKey v<CR>', { desc = 'Which Key: Visual Options' })
vim.keymap.set('n', 'd<space>', ':WhichKey d<CR>', { desc = 'Which Key: Delete Options' })

vim.keymap.set('n', 'y<space>', ':WhichKey y<CR>', { desc = 'Which Key: Yank Options' })

vim.keymap.set('n', 'c<space>', ':WhichKey c<CR>', { desc = 'Which Key: Change Options' })

local wk = lvim.builtin.which_key

-- Disable
-- BUG: This only opens
-- Once open no longer respects the leader key
-- I believe this was fixed in the old config
-- Explore for potential solution

wk.mappings["/"] = {}
wk.mappings["c"] = {}
wk.mappings["q"] = {}
wk.mappings["w"] = {}
wk.mappings["T"] = {}

-- Singles
-- ## FIX: Only opens won't close have to use ctl + \
wk.mappings["\\"] = { ':ToggleTerm<CR>', 'Open Terminal' }
wk.mappings["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }
-- wk.mappings[""] = { "", "" }
-- wk.mappings[""] = { "", "" }

-- Groups

wk.mappings.d = groups.debug
wk.mappings.g = groups.git
wk.mappings.h = groups.harpoon
wk.mappings.l = groups.lsp
wk.mappings.L = groups.lunarvim
wk.mappings.p = groups.plugins
wk.mappings.s = groups.search
wk.mappings.t = groups.tabs
wk.mappings.T = groups.todos
wk.mappings.v = groups.vim

-- print('working')

-- EVAL: Debug is using dap
-- Probably better than vimspector

--
-- No Highlights
-- ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

-- Default F command for finding files

-- ["f"] = {
--   function()
--     require("lvim.core.telescope.custom-finders").find_project_files { previewer = false }
--   end,
--   "Find File",


-- wk.mappings["n"] = { ":nohl<CR>", WhichKeyIgnoreLabel }

-- wk.mappings["z"] = { "<cmd>ZenMode<CR>", "Zen" }
-- wk.mappings["f"] = { cmd.fzflua.find_files_with_preview, "Find Files" }
-- wk.mappings["/"] = { cmd.telescope.find_in_file, "Find Text in File" }
-- -- wk.mappings[" "] = { cmd.telescope.find_open_buffer, "Open Buffers" }
-- wk.mappings[" "] = { "<C-^>", "Alternative File" }
-- wk.mappings["M"] = { "<C-w>|", "  Maximize Split" }
-- wk.mappings["r"] = { "<C-w>=", "  Restore Splits" }
-- wk.mappings["u"] = { cmd.edit.undo, "UndoTree" }

-- -- Groups
-- wk.mappings.i = groups.insert
-- wk.mappings.c = groups.copy
-- wk.mappings.T = groups.terra
-- wk.mappings.b = groups.buffers

-- -- Add this to the LunarVim Group
-- wk.mappings["Lt"] = { ":TSConfigInfo<CR>", "Treesitter Info" }

-- -- Add these two entries to the Debug Group
-- wk.mappings.d["l"] = {
--     name = "Log",
--     l = { cmd.edit.log_symbol, "Auto Log Symbol" },
--     d = { cmd.edit.delete_logs, "Delete Logs" },
-- }

-- -- How to ignore label
-- wk.mappings[""] = { "", WhichKeyIgnoreLabel }
