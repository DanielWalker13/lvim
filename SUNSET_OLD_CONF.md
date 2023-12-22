
# Items to sunset old conf


## Python 


### Add 

```lua 

-- Setup Python Path
function set_python3_host()
  -- Command to find the path of python
  local find_python3 = "which python3"
  
  -- Run the command and get the output
  local python3_path = io.popen(find_python3):read("*a")
  
  -- Remove newline character from the output
  python3_path = python3_path:gsub("%s+", "")
  
  -- Check if the path is not empty
  if python3_path ~= "" then
    -- Set the python3_host_prog variable in vim
    vim.g.python3_host_prog = python3_path
  else
    print("Python 3 path not found!")
  end
end

-- Call the function to set the Python 3 host program
set_python3_host()

   -- vim.g.python3_host_prog = '~/.asdf/shims/python'

```


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

<!-- TODO: Make Lua Troubleshotting guide -->
# Troubleshooing EX Commands

echo &<option-name>
verbose set <option-name>


TODO: Create archive 
# Archive just in case 

#### Sign Column
Legacy from nvim - lunarvim doesn't seem to have the sign column problem 
```lua 
  -- Sets background for Sign Column and empty space to transparent
  -- vim.cmd [[
  --     autocmd vimenter * hi LineNr guibg=NONE ctermbg=NONE
  --     autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
  -- ]]
```
