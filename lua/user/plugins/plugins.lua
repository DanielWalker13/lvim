
-- Create readme for unused potential plugins / config

lvim.plugins = {

    { "ThePrimeagen/harpoon" },
    {"folke/todo-comments.nvim"},         -- Todo: Add color comments for all caps key words
    {"tpope/vim-repeat"},                 -- Extends repeat functionallity 
    {"tpope/vim-fugitive"},               -- Git - interation functionality
    {"vim-scripts/IndexedSearch"},        -- Displays number of search matches in lower bar
    {"psliwka/vim-smoothie"},             -- Enhances scrolling capabilities
    {"mbbill/undotree"},                  -- Shows you undo revisions
    {"axiaoxin/vim-json-line-format"},    -- Pretty Json - Plugin to format 
    {"godlygeek/tabular"},                -- Aligns text anywhwere in string with regex 
    {"github/copilot.vim"},               -- AI: Coding Assistane  
    {"tpope/vim-surround",},              -- Surround - quick surrond of elements
    { "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },                                    -- Enhances buffer for error lists, location lists, and quickfix lists

-- EVAL: Commented plugins and settings 

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
--
--     { "b0o/incline.nvim" },
--     { "folke/trouble.nvim" },
--     { "folke/zen-mode.nvim" },
--     { "kazhala/close-buffers.nvim" },
--     {
--         "anuvyklack/pretty-fold.nvim",
--         requires = { { "anuvyklack/fold-preview.nvim" }, { "anuvyklack/keymap-amend.nvim" } },
--     },
  --
--     {
--         "kylechui/nvim-surround",
--         tag = "*",
--     },
  --
--     {
--         "windwp/nvim-ts-autotag",
--         requires = "nvim-treesitter/nvim-treesitter",
--         after = "nvim-treesitter",
--     },
  --
--     {
--         "nvim-treesitter/playground",
--         requires = "nvim-treesitter/nvim-treesitter",
--         after = "nvim-treesitter",
--         run = ":TSInstall query",
--     },
  --
--     {
--         "nvim-treesitter/nvim-treesitter-context",
--         requires = "nvim-treesitter/nvim-treesitter",
--         after = "nvim-treesitter",
--     },
  --
--     {
--         "s1n7ax/nvim-window-picker",
--         tag = "v1.*",
--     },
  --
--     {
--         "nmac427/guess-indent.nvim",
--     },
  --
--     {
--         "ibhagwan/fzf-lua",
--         requires = { "https://github.com/nvim-tree/nvim-web-devicons.git" },
--     },
  --
--     {
--         "dnlhc/glance.nvim",
--     },
  --
--     { "~/Documents/dev/repos/personal/terra-theme/nvim" },
--     { "chentoast/marks.nvim" },
--     -- { "terra-theme/nvim" },
--     { "nvim-telescope/telescope-ui-select.nvim" },
--     { "ThePrimeagen/vim-be-good" },
--     { "mbbill/undotree" },
--     { "EdenEast/nightfox.nvim" },
  --
--     {
--         "anuvyklack/windows.nvim",
--         requires = {
--             "anuvyklack/middleclass",
--             "anuvyklack/animation.nvim",
--         },
--     },
  --
--     {
--         "zbirenbaum/copilot.lua",
--         event = { "VimEnter" },
--         -- NOTE: Load the plugin settings with delay
--         config = function()
--             ---@diagnostic disable-next-line: param-type-mismatch
--             vim.defer_fn(function()
--                 require("user.plugins.configs.copilot")
--                 ---@diagnostic disable-next-line: param-type-mismatch
--             end, 200)
--         end,
--     },
}
