
# Items to sunset old conf

### Colorsheme
    - Find Best option for colorscheme management
    - Identify best colorscheme options

    - Gruvbox only configs

```lua 
  -- vim.g.gruvbox_termcolors=16
  -- vim.cmd('let g:gruvbox_termcolors=16')
```


#### Telescope 

<!-- RESEARCH: Investigate what this config did -->
<!-- After config file is doing basic alterations to file specific settings -->
    - Fixes file type recognition for certain files
```lua 
-- telescope.
-- require('telescope.builtin').builtin.colorscheme()
-- lua require('telescope.builtin').telescope.buffer.buffer()
-- telescope.builtin.buffers()
```

### Whichkey 
<!-- RESEARCH: This may have been resolved by lunarvim? -->
<!-- I haven't run into a menu rendering wrong -->

```lua 
  -- BUG: only whichkey menu renders well
  -- vim.cmd[[
  --   autocmd ColorScheme * highlight Pmenu ctermbg=234 guibg=#060a0f
  -- ]]
```

# Troubleshooing EX Commands

- Add hot keys for these 
```vims
  :verbose set <option-name>
  :echo &<option-name>
```


