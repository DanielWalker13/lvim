local present, picker = pcall(require, "window-picker")
if not present then
  return
end

M = {}

M.pick_window = function()
  local picked_window_id = picker.pick_window()

  if picked_window_id then
    vim.api.nvim_set_current_win(picked_window_id)
  else
    vim.notify("   Something went wrong\nPicked Window Id is `nil`", "warn", {
      timeout = 1000,
      render = "minimal",
    })
    return
  end
end

M.pick_window()


return M

-- :lua require('user.cmd.nav').pick_window()

-- :lua vim.api.nvim_set_current_win(0)
