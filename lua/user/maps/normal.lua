-- local cmd          = require("user.cmd")

----------------------------------------------------------- No Leader
local n_map        = lvim.lsp.buffer_mappings.normal_mode
local n_map_single = lvim.keys.normal_mode


-- Disable

-- General

-- Motion


n_map['g;'] = { 'g;zz', 'Remaps last edit motions to center to screen' }
n_map['n']  = { 'nzz', 'Remaps next motions to center to screen' }
n_map['N']  = { 'Nzz', 'Remaps previous motions to center to screen' }
n_map['k']  = { 'gk', 'Motion works with wrap on seperate line' }
n_map['gk'] = { 'k', 'Motion works with wrap on seperate line' }
n_map['j']  = { 'gj', 'Motion works with wrap on seperate line' }
n_map['gj'] = { 'j', 'Motion works with wrap on seperate line' }


-- n_map['K'] = nil
-- n_map_single['K'] = ":echo 'Okay!'<CR>"


-- Experiment



-- TODO: Additional testing to ensure this is working properly
-- Remaps class definition jumps to class and function for python
--
-- autocmd FileType python nnoremap <buffer> [[ ?^class\\|^\s*def<CR>
-- autocmd FileType python nnoremap <buffer> ]] /^class\\|^\s*def<CR>
-- autocmd FileType python nnoremap <buffer> [[ ?^\s*\zs\<class\>\\|^\s*\zs\<def\><CR>
-- autocmd FileType python nnoremap <buffer> ]] /^\s*\zs\<class\>\\|^\s*\zs\<def\><CR>


-- NOTE: Evaluate this guys mappings

-- RESEARCH: - Can get this custom functiont to map or execute
-- ["C-f"] = cmd.nav.pick_window

-- n_map["<C-p>"] = cmd.fzflua.find_files_with_preview

-- Function Keys
-- RESEARCH: Lunar vim quick fix list
-- QuickFixToggle()
--
-- n_map[""] = "<cmd>roubleToggle<CR>"
-- ::

--NOTE: Currently disabled because used for TMUX navigation
-- n_map["<M-h>"] = ":bprevious<CR>"
-- n_map["<M-l>"] = ":bnext<CR>"

-- FIX: Unfortunately this doesnt work atm
-- vim.cmd("let g:tmux_navigator_no_mappings = 1")
-- n_map["<C-h>"] = ":TmuxNavigateLeft<CR>"
-- n_map["<C-j>"] = ":TmuxNavigateDown<CR>"
-- n_map["<C-k>"] = ":TmuxNavigateUp<CR>"
-- n_map["<C-l>"] = ":TmuxNavigateRight<CR>"



-- -- Buffer Maps
-- local n_buffer_map = lvim.lsp.buffer_mappings.normal_mode


-- -- G-Maps
-- -- Trouble
-- -- n_map["gd"] = { "<cmd>Trouble lsp_definitions<CR>", "LSP Definitons" }
-- -- n_map["gr"] = { "<cmd>Trouble lsp_references<CR>", "LSP References" }

-- -- Glance
-- n_map["gr"] = { "<cmd>Glance references<CR>", "LSP References" }
-- n_map["gd"] = { "<cmd>Glance definitions<CR>", "LSP Definitons" }
-- n_map["gy"] = { "<cmd>Glance type_definitions<CR>", "LSP Type Definitons" }
-- n_map["gi"] = { "<cmd>Glance implementations<CR>", "LSP Implementations" }

n_map["gm"] = { "<cmd>Telescope marks theme=cursor<CR>", "LSP Implementations" }
