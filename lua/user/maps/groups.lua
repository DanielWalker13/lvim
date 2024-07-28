M.debug = {
  name = "Debug: dap",
  t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
  b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
  c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
  C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
  d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
  g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
  i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
  o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
  u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
  r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
  s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
  q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
  U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
}


M.git = {
  name = "Git: Fugitive",

  a = { ':Gwrite<CR>', 'Git Add Current File' }, -- tested
  b = {
    name = 'Git Branch',
    b = { ':Git branch<CR>', 'Check Local Branch' },         -- tested
    c = { ':Git blame<CR>', 'Blame: Changes Line by Line' }, -- tested
    r = { ':Git branch -a<CR>', 'Check Remote Branches' },   -- tested
  },

  c = { ':Git commit<CR>', 'Git Commit' }, -- tested
  d = { ':Gvdiff <CR>', 'Git Diff' },      -- tested

  f = { ':Git fetch<CR>', 'Git Fetch' },
  -- g = {'', '' },
  i = { ':Git pull<CR>', 'Git Pull' },
  l = {
    name = 'Git Log',
    c = { ':Gclog<CR>', 'Git Commit Log' }, -- tested
    l = { ':Git log<CR>', 'Git Log' },      -- tested
  },
  o = { ':Git checkout', 'Git Diff' },      -- tested
  m = { ':Git merge', 'Git Merge' },

  s = { ':Git<CR>', 'Gittatus' },      -- tested
  p = { ':Git push<CR>', 'Git Push' }, -- tested

  -- TODO: GIT Feature: How to push branch to origin - first push
  -- o = {':silent exec "Git push origin " . fugitive#head()<CR><CR>', 'Git Push Origin' },
}

-- TODO: Git Features: Stock
-- g = {
--   name = "Git",
--   g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
--   j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
--   k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
--   l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--   p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--   r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--   R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--   s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--   u = {
--     "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--     "Undo Stage Hunk",
--   },
--   o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--   b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--   c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--   C = {
--     "<cmd>Telescope git_bcommits<cr>",
--     "Checkout commit(for current file)",
--   },
--   d = {
--     "<cmd>Gitsigns diffthis HEAD<cr>",
--     "Git Diff",
--   },
-- },
-- Closing bracker above todo

M.harpoon = {

  name = 'Harpoon: Workspace Management',
  a = { ':lua require("harpoon.mark").add_file() <CR>', 'Add file' },
  m = { ':lua require("harpoon.ui").toggle_quick_menu() <CR>', 'Menu' },
  -- EVAL: Does Telescope version bring anything to the table
  -- m = {':Telescope harpoon marks<CR>',  'Menu' },
  n = { ':lua require("harpoon.ui").nav_next() <CR>', 'Next buffer' },
  p = { ':lua require("harpoon.ui").nav_prev() <CR>', 'Previous Buffer' },
  j = { ':lua require("harpoon.ui").nav_file(1) <CR>', 'Secect 1st buffer' },
  k = { ':lua require("harpoon.ui").nav_file(2) <CR>', 'Secect 2st buffer' },
  l = { ':lua require("harpoon.ui").nav_file(3) <CR>', 'Secect 3st buffer' },
  [";"] = { ':lua require("harpoon.ui").nav_file(4) <CR>', 'Secect 4st buffer' },
}

M.lsp = {
  name = "LSP: Test",
  a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
  d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
  w = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
  i = { "<cmd>LspInfo<cr>", "Info" },
  I = { "<cmd>Mason<cr>", "Mason Info" },
  j = {
    "<cmd>lua vim.diagnostic.goto_next()<cr>",
    "Next Diagnostic",
  },
  k = {
    "<cmd>lua vim.diagnostic.goto_prev()<cr>",
    "Prev Diagnostic",
  },
  l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
  q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
  r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
  s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
  S = {
    "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
    "Workspace Symbols",
  },

  -- This may already be or should be in debug
  e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
}



M.lunarvim = {
  name = "LunarVim: Setting",
  c = {
    "<cmd>edit " .. get_config_dir() .. "/config.lua<cr>",
    "Edit config.lua",
  },
  d = { "<cmd>LvimDocs<cr>", "View LunarVim's docs" },
  f = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').find_lunarvim_files()<cr>",
    "Find LunarVim files",
  },
  g = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').grep_lunarvim_files()<cr>",
    "Grep LunarVim files",
  },
  k = { "<cmd>Telescope keymaps<cr>", "View LunarVim's keymappings" },
  i = {
    "<cmd>lua require('lvim.core.info').toggle_popup(vim.bo.filetype)<cr>",
    "Toggle LunarVim Info",
  },
  I = {
    "<cmd>lua require('lvim.core.telescope.custom-finders').view_lunarvim_changelog()<cr>",
    "View LunarVim's changelog",
  },
}

M.plugins = {
  name = "Plugins: Lazy",
  c = { "<cmd>Lazy clean<cr>", "Clean" },
  d = { "<cmd>Lazy debug<cr>", "Debug" },
  i = { "<cmd>Lazy install<cr>", "Install" },
  l = { "<cmd>Lazy log<cr>", "Log" },
  p = { "<cmd>Lazy profile<cr>", "Profile" },
  s = { "<cmd>Lazy sync<cr>", "Sync" },
  S = { "<cmd>Lazy clear<cr>", "Status" },
  u = { "<cmd>Lazy update<cr>", "Update" },
}


M.search = {
  name = "Search: Telescope", -- optional group name
  -- b = {'<cmd>Telescope buffers<cr>', 'Search Buffers'},
  b = { '<cmd>Telescope file_browser<cr>', 'Search Buffers' },
  d = { '<cmd>Telescope spell_suggest<cr>', 'Seach Dictionary' },
  e = { '<cmd>TodoTelescope<cr>', 'Errors' },
  f = { '<cmd>Telescope find_files<cr>', "Seearh Files: Current Dir" },
  --     r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap=false, buffer = 123 }, -- additional options for creating the keymap
  g = {
    name = "Git",
    -- Branch: checkout action <cr>, track action <C-t> and rebase action<C-r>
    b = { '<cmd>Telescope git_branches <cr>', 'Lists all branches ' },
    c = { '<cmd>Telescope git_commits <cr>', 'Lists Git Commits' },
    -- Buffer: checks them out on <cr>
    d = { '<cmd>Telescope git_bcommits <cr>', 'Current Buffer Commits' },
    f = { '<cmd>Telescope git_files<cr>', 'Search Git Files' },

    g = { ':lua require("telescope.builtin").grep_string({ search = vim.fn.input("Find in Project > ")})<Cr>',
      'List Stach' },
    h = { '<cmd>Telescope git_stash <cr>', 'List Stach' },
    --  Status: Checkout action <cr>,
    --  Status: Reset mixed <C-r>m, soft <C-r>s, hard <C-r>h
    s = { '<cmd>Telescope git_status	<cr>', 'Git Status' },

  },
  h = { '<cmd>Telescope help_tags<cr>', 'Seach Help' },
  -- FIX: Leader tk not working
  k = { '<cmd>Telescope keymaps<cr>', 'Seach Key Maps' },

  l = {
    name = "LSP: Test",
    b = { '<cmd>Telescope lsp_document_symbols <cr>', 'LSP document symbolsin the current buffer' },
    d = { '<cmd>Telescope lsp_definitions <cr>', 'Go to Definition' },
    i = { '<cmd>Telescope lsp_incoming_calls <cr>', 'LSP incoming calls for current word' },
    o = { '<cmd>Telescope lsp_outgoing_calls <cr>', 'LSP outgoing calls for current word ' },
    r = { '<cmd>Telescope lsp_references <cr>', 'LSP references for current word' },
    s = { '<cmd>Telescope lsp_implementations <cr>', 'Go to Source' },
    t = { '<cmd>Telescope lsp_type_definitions <cr>', 'Go to Type Definition' },
    w = { '<cmd>Telescope lsp_workspace_symbols <cr>', 'LSP document symbols in the current workspace' },

  },
  m = { '<cmd>Telescope man_pages <cr>', 'Seach Man Pages' },
  o = { '<cmd>Telescope vim_options <cr>', 'Seach Vim Options' },
  q = { '<cmd>Telescope quickfix <cr>', 'Seach Quick Fix' },


  r = { '<cmd>Telescope registers <cr>', 'Seach Registers' },
  s = { '<cmd>Telescope live_grep <cr>', 'Rip Grep' },
  -- t = {'<cmd>TodoTelescope <cr>', 'Treesitter: Lists Function names, variables'},
}


M.tabs  = {
  name = "Tabs: Enhancment",
  n = { ":tabnew", "New Tab" },
  h = { ":tabprevious<CR>", "Previous Tab" },
  l = { ":tabnext<CR>", "Next Tab" },

  r = {
    function()
      vim.ui.input({
        prompt = "  Enter a Name for the Tab",
      }, function(input)
        if input then
          vim.cmd("LualineRenameTab " .. input)
        else
          return
        end
      end)
    end,
    "Rename Tab",
  },

  -- EVAL: Shouls I group these under move nesting
  F = { ':tabmove 0<CR>', 'Move tab to first postition' },
  H = { ":tabmove -1<CR>", "Move Left" },
  L = { ":tabmove +1<CR>", "Move Right" },
  E = { ":tabmove<CR>", "Move Tab To End" },

  -- q = { ":tabclose<CR>", "Close Tab" },
  o = { ":tabonly<CR>", "Only Tab" },

  -- Confirm what this does
  O = { "<C-w>T", "Open in new Tab" },
  ["1"] = { "1gt", "Tab 1" },
  ["2"] = { "2gt", "Tab 2" },
  ["3"] = { "3gt", "Tab 3" },
  ["4"] = { "4gt", "Tab 4" },
  ["5"] = { "5gt", "Tab 5" },
  ["6"] = { "6gt", "Tab 6" },
  ["7"] = { "7gt", "Tab 7" },
  ["8"] = { "8gt", "Tab 8" },
  ["9"] = { "9gt", "Tab 9" },
}

M.todos = {
  name = 'Tasks: Todo',

  -- TODO: add todo vim conf fix list?
  -- Specific dire can be references for todo context
  -- :TodoTrouble cwd=~/projects/foobar

  -- l = {
  --   name = 'List version',
  --   f = {'<cmd>TodoLocList keywords=FIX,FIXME,BUG,FIXIT,ISSUE,TODO,UPGRADE,RESEARCH,OPTIM,PERFORMANCE,OPTIMIZE,DOCUMENT<cr>', 'Todo Fix Me Tags' },
  --   i = {'<cmd>TodoLocList keywords=INFO, NOTE<cr>', 'Todo Info Tags' },
  --   r = {'<cmd>TodoLocList keywords=RESEARCH,OPTION,GOOD,OK,BEST<cr>', 'Todo Research Tags' },
  --   t = {'<cmd>TodoLocList keywords=TEST,TESTING,PASSED,FAILED<cr>', 'Todo Testing Tags' },
  -- },


  a = { '<cmd>TodoTelescope<cr', 'All Tags' },
  f = {
    '<cmd>TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE,TODO,UPGRADE,RESEARCH,OPTIM,PERFORMANCE,OPTIMIZE,DOCUMENT,TEST<cr>',
    'Todo Fix Me Tags' },
  i = { '<cmd>TodoTelescope keywords=INFO,NOTE<cr>', 'Todo Info Tags' },
  r = { '<cmd>TodoTelescope keywords=RESEARCH,OPTION,GOOD,OK,BEST<cr>', 'Todo Research Tags' },
  t = { '<cmd>TodoTelescope keywords=TEST,TESTING,PASSED,FAILED<cr>', 'Todo Testing Tags' },
}

M.vim   = {
  name = 'Vim: Congig',
  h = { "<cmd>nohlsearch<CR>", "No Highlight" },
}

return M
