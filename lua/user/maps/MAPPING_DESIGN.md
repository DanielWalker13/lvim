
# Which Key Mappings

## Future state
    <space> = Open immediately 
    ; = Lvim Dashboard
    d = debug ? 
    e = Explorer
    f = Find File ? - Moved to Search 
        f = Features
    g = Git 
    h = Harpoon 
    i = Info
    l = LSP
    L = Lunar Vim 
    m = Menu
    s = Search
    S = Split - ? 
    t = tabs
    T = Todo ? 
    v = Setting toggle 
    V = vimspector - Temp: Compare with dap features
    

## Current 


### Bad / default inhereted settings 

figure out how to unset / override / comment or not display

    - '/' both assigned to the same thing 
    - '\' both assigned to the same thing 
        - Assginment = view current search (/) index
            - # of x # of findings from search


b = Buffers

    - Explore what all the features are 

d = debug 

    - New version uses dap 
        + Proably better
    - old config had vimspector for this 
    - identify what buit in is
    - compare to the built in 
    - Explore what all the features are 

e = explorer

    - old version used 'n' for nerdtree
    - eval and decide
    - This seems worth buring a whole key for as core functionallity

f = find 

    - There is also Search 
    - Going with s key over f key for now 
    - Favoring 's' because I was using split for s 
    - Split sunsetted for <clt + <hk>> lvim built in 
        - new splits need an entry in features
            - Horiz & Vert
            - Should I go back to tmux
        - This opens f to be used for 'Feature'
            - A catch all for misc single use type functionallity 
            - Or lesser nesting
                - Example: Relitive number toggle or Json formatting

g = Git 

    - compare the two and make best config


l = LSP

    - Eval all required features
    - Explort and document for workflow


L = Lunarvim 

    - Leveraged for config and metadata
    - Explort and document for workflow

p = Plugins

    - good addition 
    - Only includes plugin manager 
        - May want to add Treesitter and mason here

s = Search 

    - Explore what's different from f

T = Treesitter
    - Sunset to integrate with info or plugins
    - Consider how many features are being used here vs plugin 
    - maybe consolidate 




## Requirements

# Special common edits

### Single feature list

No more highlights

    - :nohl<CR>
    - old config
        - m > c = { ':nohl<CR><C-l>', 'Clear Highlighing' },

Relitave Numbers

    r = { ':NumbersToggle<CR>', 'Toggles Relitive numbers' },

Goole search in new tab

    s = { ':.! open "http://google.com/search?q="<left>', 'Gooogle Search Hack' },

Nerdtree 
    
    Probably deserves its own key
    n = { ':NvimTreeToggle<CR>', 'NerdTree: Togggle Sidebar' },

splits
    
    - horazontal 
        :sp 
    - vertical
        :vsp

Tabulizer

    a = { ':Tabularize /', 'Aligns blocks by character' },

### Menus
UndoTree

    u = { ':UndotreeToggle<CR>', 'UndoTree Toggle' },

Yank Ring

    y = { ':silent YRShow<CR>', 'Yank Ring: Toggle' }

### Python

    Does this deserve its own key
    b = { ':Black<CR>', 'Black: Python Linter' },


### Vim features? 
    - Things like relitive numbers here instead of f for features

### ChatGPT
These may need some kind of toggle incase you don't have  a ChatGPT account

    c = {
      name = 'ChatGPT: AI Suggestions',
      c = { ':ChatGPT<CR>', 'Opens ChatGPT Window' },
      i = { ':ChatGPTEditWithInstructions<CR>', 'Opens ChatGPT Window with Instructions' },
    },

### Task list

### Explorer
  - Old version 
```lua
  n = { ':NvimTreeToggle<CR>', 'NerdTree: Togggle Sidebar' }
```

### Find / Search 

### Vim Setting toggles

### Git 
    - Evaluated and consolidated Git Sign and Fugitive features
    - Create overarching which key get map group


### Tabs 

    - group created 
    - Waiting for key assignment

### Info 
    - checkhealth
    - TSConfigInfo 
    - Mason

