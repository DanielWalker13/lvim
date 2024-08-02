-- Unsets default maps for cmp which get in the way of copilot
-- Then reloads copilot config

local cmp = require("cmp")
local cmp_mapping = require("cmp.config.mapping")
local luasnip = require("luasnip")

-- Custom function for jumpable
local function jumpable(dir)
  local luasnip_ok, luasnip_module = pcall(require, "luasnip")
  if not luasnip_ok then
    return false
  end

  local win_get_cursor = vim.api.nvim_win_get_cursor
  local get_current_buf = vim.api.nvim_get_current_buf

  local function seek_luasnip_cursor_node()
    if not luasnip_module.session.current_nodes then
      return false
    end

    local node = luasnip_module.session.current_nodes[get_current_buf()]
    if not node then
      return false
    end

    local snippet = node.parent.snippet
    local exit_node = snippet.insert_nodes[0]

    local pos = win_get_cursor(0)
    pos[1] = pos[1] - 1

    if exit_node then
      local exit_pos_end = exit_node.mark:pos_end()
      if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
        snippet:remove_from_jumplist()
        luasnip_module.session.current_nodes[get_current_buf()] = nil
        return false
      end
    end

    node = snippet.inner_first:jump_into(1, true)
    while node ~= nil and node.next ~= nil and node ~= snippet do
      local n_next = node.next
      local next_pos = n_next and n_next.mark:pos_begin()
      local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
          or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

      if n_next == nil or n_next == snippet.next then
        snippet:remove_from_jumplist()
        luasnip_module.session.current_nodes[get_current_buf()] = nil
        return false
      end

      if candidate then
        luasnip_module.session.current_nodes[get_current_buf()] = node
        return true
      end

      local ok
      ok, node = pcall(node.jump_from, node, 1, true)
      if not ok then
        snippet:remove_from_jumplist()
        luasnip_module.session.current_nodes[get_current_buf()] = nil
        return false
      end
    end

    if exit_node then
      luasnip_module.session.current_nodes[get_current_buf()] = snippet
      return true
    end

    snippet:remove_from_jumplist()
    luasnip_module.session.current_nodes[get_current_buf()] = nil
    return false
  end

  if dir == -1 then
    return luasnip_module.in_snippet() and luasnip_module.jumpable(-1)
  else
    return luasnip_module.in_snippet() and seek_luasnip_cursor_node() and luasnip_module.jumpable(1)
  end
end

-- Function to check if there are words before cursor
local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Override default mappings
lvim.builtin.cmp.mapping = {
  ["<Tab>"] = cmp_mapping(function(fallback)
    fallback()
  end, { "i", "s" }),
  ["<S-Tab>"] = cmp_mapping(function(fallback)
    fallback()
  end, { "i", "s" }),
  ["<C-n>"] = cmp_mapping(function(fallback)
    fallback()
  end, { "i", "c" }),
  ["<C-p>"] = cmp_mapping(function(fallback)
    fallback()
  end, { "i", "c" }),
  ["<S-CR>"] = cmp_mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_locally_jumpable() then
      luasnip.expand_or_jump()
    elseif jumpable(1) then
      luasnip.jump(1)
    elseif has_words_before() then
      fallback()
    else
      fallback()
    end
  end, { "i", "s" }),
  ["<S-Space>"] = cmp_mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s" })
}

-- Source the Copilot configuration
require('user.copilot')


-- -- Load necessary modules
-- local cmp = require("cmp")
-- local cmp_mapping = require("cmp.config.mapping")
-- local luasnip = require("luasnip")

-- -- Custom function for jumpable
-- local function jumpable(dir)
--   local luasnip_ok, luasnip_module = pcall(require, "luasnip")
--   if not luasnip_ok then
--     return false
--   end

--   local win_get_cursor = vim.api.nvim_win_get_cursor
--   local get_current_buf = vim.api.nvim_get_current_buf

--   local function seek_luasnip_cursor_node()
--     if not luasnip_module.session.current_nodes then
--       return false
--     end

--     local node = luasnip_module.session.current_nodes[get_current_buf()]
--     if not node then
--       return false
--     end

--     local snippet = node.parent.snippet
--     local exit_node = snippet.insert_nodes[0]

--     local pos = win_get_cursor(0)
--     pos[1] = pos[1] - 1

--     if exit_node then
--       local exit_pos_end = exit_node.mark:pos_end()
--       if (pos[1] > exit_pos_end[1]) or (pos[1] == exit_pos_end[1] and pos[2] > exit_pos_end[2]) then
--         snippet:remove_from_jumplist()
--         luasnip_module.session.current_nodes[get_current_buf()] = nil
--         return false
--       end
--     end

--     node = snippet.inner_first:jump_into(1, true)
--     while node ~= nil and node.next ~= nil and node ~= snippet do
--       local n_next = node.next
--       local next_pos = n_next and n_next.mark:pos_begin()
--       local candidate = n_next ~= snippet and next_pos and (pos[1] < next_pos[1])
--           or (pos[1] == next_pos[1] and pos[2] < next_pos[2])

--       if n_next == nil or n_next == snippet.next then
--         snippet:remove_from_jumplist()
--         luasnip_module.session.current_nodes[get_current_buf()] = nil
--         return false
--       end

--       if candidate then
--         luasnip_module.session.current_nodes[get_current_buf()] = node
--         return true
--       end

--       local ok
--       ok, node = pcall(node.jump_from, node, 1, true)
--       if not ok then
--         snippet:remove_from_jumplist()
--         luasnip_module.session.current_nodes[get_current_buf()] = nil
--         return false
--       end
--     end

--     if exit_node then
--       luasnip_module.session.current_nodes[get_current_buf()] = snippet
--       return true
--     end

--     snippet:remove_from_jumplist()
--     luasnip_module.session.current_nodes[get_current_buf()] = nil
--     return false
--   end

--   if dir == -1 then
--     return luasnip_module.in_snippet() and luasnip_module.jumpable(-1)
--   else
--     return luasnip_module.in_snippet() and seek_luasnip_cursor_node() and luasnip_module.jumpable(1)
--   end
-- end

-- -- Function to check if there are words before cursor
-- local function has_words_before()
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

-- -- Custom mappings
-- lvim.builtin.cmp.mapping["<S-CR>"] = cmp_mapping(function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   elseif luasnip.expand_or_locally_jumpable() then
--     luasnip.expand_or_jump()
--   elseif jumpable(1) then
--     luasnip.jump(1)
--   elseif has_words_before() then
--     fallback()
--   else
--     fallback()
--   end
-- end, { "i", "s" })

-- lvim.builtin.cmp.mapping["<S-Space>"] = cmp_mapping(function(fallback)
--   if cmp.visible() then
--     cmp.select_prev_item()
--   elseif luasnip.jumpable(-1) then
--     luasnip.jump(-1)
--   else
--     fallback()
--   end
-- end, { "i", "s" })
