-- NOTE: Danny created
-- Remove after consolication
local present, todo = pcall(require, "todo-comments")
if not present then
    return
end

local task_configs = {
  signs = true, -- show icons in the signs column
  sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
  keywords = {
    FIX = { icon = ' ',
      color = 'error', -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE' }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    -- UPGRADE: Create a good / ok / bad catagory
    -- Ensure that serch catagories still capture the right keyword groups

    TODO = { icon = ' ', color = 'todo' },
    UPGR = { icon = ' ', color = 'upgrade', alt = {'UPGRADE', 'RESEARCH'} },
    WARN = { icon = ' ', color = 'warning', alt = {'WARNING'} },
    PERF = { icon = ' ', color = 'perf', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE'} },
    NOTE = { icon = ' ', color = 'note', alt = { 'INFO', 'DOCUMENT', 'OPTION'} },
    TEST = { icon = ' ', color = 'test', alt = { 'TESTING', 'PASSED', 'ACTIVE','GOOD', 'FAILED'} },
    EVAL = { icon = ' ', color = 'eval', alt = { 'OK', 'BEST', 'FEATURE', 'REVIEW'} },
    -- HACK = { icon = " ", color = "warning" },

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
    multiline = true, -- enable multine todo comments
    multiline_pattern = '^.', -- lua pattern to match the next multiline from the start of the matched keyword
    multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
    before = '', -- 'fg' or 'bg' or empty
    keyword = 'wide', -- 'fg', 'bg', 'wide', 'wide_bg', 'wide_fg' or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
    after = 'fg', -- 'fg' or 'bg' or empty
    pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
    comments_only = true, -- uses treesitter to match keywords in comments only
    max_line_len = 400, -- ignore lines longer than this
    exclude = {}, -- list of file types to exclude highlighting
  },
  -- list of named colors where we try to extract the guifg from the
  -- list of highlight groups or use the hex color if hl not found as a fallback

  -- FIX:
  -- TODO:
  -- UPGRADE:
  -- WARN:
  -- OPTIM:
  -- NOTE:
  -- TEST:
  -- EVAL:

  colors = {
    todo = { 'TasksToDo', '#00AEDB' },
    upgrade = { 'Upgrade', '#FFBf00' },
    perf= { 'Performance', '#2389DA' },
    note = { 'DiagnosticHint', '#ACE1AF' },
    default = { 'Identifier', '#7C3AED' },
    test = { 'Test Me', '#0BB159' },
    eval = {'Evaluate', '#5D5D5D' },
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
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
    pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}

require('todo-comments').setup(task_configs )
