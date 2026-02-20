# nvim-config
This is a repo containing my neovim configuration.
I have only switched to neovim recently (Jan 2026)
Coming from VS Code, the bindings as well as the config setup was really fun to do and using a plugin manager like lazy made it quite simple.

For reference, I am currently using nvim when I program in mainly C or Haskell. Apart from that, it is quite annoying to work with jupyter notebooks so I sometimes use VS code when needed.

I am still learning so I do understand that not everything is configured fully and most things have not been super customised. 
Hopefully this repo is helpful to you :)

### Future Improvements
Currently, I have made minimal adjustments to the plugins' settings as I am mostly getting a feel of working with neovim. I will work on customising my config further, especially teletype, LSPs, autocommands and so on.
I would be quite interesting to write my own plugin as well :)

## Requirements
- Neovim ≥ 0.9 (ideally latest version)
- Git
- Build-Essential
- Ripgrep
- Node.js
- Nerd Font (I personally use Monofur Nerd Font)

to install follow your package manager's guide
each package may need additional requirements

Nerd Fonts is slightly different
You can find and download the fonts [here](https://www.nerdfonts.com/). Then you can change the font of your terminal, see what your OS recommends or find a suitable guide online.

## Installation Guide
If you already have an existing config you should back it up.
Otherwise you can clone the config into your neovim config directory (this will depend on your OS).

1. Open neovim from the command line using `nvim`
2. Inside neovim, run `:Lazy`. This will install all configured plugins.
3. Once installation completes, restart neovim and run the previous command again to confirm installation of all the plugins.
4. You can then install the language servers you would like to use by running `:Mason`.

You can adjust as per your liking using the configs in [lsp](./lsp) folder and enable in [lsp.lua](./lua/config/lsp.lua).

6. Finally run `:checkhealth` to make sure everything is working. If so then you are good to go :)

## Config
Plugin Manager :  [**lazy.nvim**](https://github.com/folke/lazy.nvim)

I found it very modular and easy to use plugins.

### Config Structure
Quite a modular system.
- [init.lua](./init.lua) bootstraps everything
- [lsp](./lsp) contains configs for Language servers
- [autocmd.lua](./lua/config/autocmd.lua) sets up autocommands (auto-formatting etc)
- [lazy.lua](./lua/config/lazy.lua) bootstraps lazy plugin manager
- [lsp.lua](./lua/config/lsp.lua) loads lsps/ensures they're enabled
- [mappings.lua](./lua/config/mappings.lua) contains keybindings
- [options.lua](./lua/config/options.lua) contains options for neovim editor settings
- [plugins](./lua/plugins) contains configs for plugins

### Plugins
Please note that these plugins have their own dependencies so check each plugin's guide.

- Start-up menu: [**alpha.nvim**](https://github.com/goolord/alpha-nvim)
- Auto-close brackets / pairs: [**nvim-autopairs**](https://github.com/windwp/nvim-autopairs)
- Buffer line (tab-style buffers): [**bufferline.nvim**](https://github.com/akinsho/bufferline.nvim)
- LSP alternative / completion engine: [**coc.nvim**](https://github.com/neoclide/coc.nvim)
- Highlight colour codes: [**nvim-colorizer.lua**](https://github.com//catgoose/nvim-colorizer.lua)
- Git integration (signs, hunks): [**gitsigns.nvim**](https://github.com/lewis6991/gitsigns.nvim)
- Colourscheme: [**gruvbox.nvim**](https://gitlab.com/motaz-shokry/gruvbox.nvim)
- LSP/DAP/Linter installer: [**mason.nvim**](https://github.com/mason-org/mason.nvim)
- File explorer: [**nvim-tree.lua**](https://github.com/nvim-tree/nvim-tree.lua)
- Syntax highlighting / parsing: [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter)
- Status line: [**lualine.nvim**](https://github.com/beauwilliams/statusline.lua)
- Fuzzy finder: [**telescope.nvim**](https://github.com/nvim-telescope/telescope.nvim)
- Programming sessions data: [**triforce**](https://github.com/gisketch/triforce.nvim)
- Highlights occurrences in a file of text selected in visual mode: [**visimatch**](https://github.com/wurli/visimatch.nvim)

## Key Bindings
Chatgpt wrote the code for [mappings.lua](./lua/config/mappings.lua) as it was mostly trivial and repetitive code. Pretty standard bindings that allows you to do most things. Will add keybindings as I go on.

---

### Core
| Key | Action |
|------|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit window |
| `<leader>/` | Clear search highlights |
| `<Esc>` | Clear search highlights |

---

### Window / Split Navigation
| Key | Action |
|------|--------|
| `<C-h>` | Move to left split |
| `<C-j>` | Move to lower split |
| `<C-k>` | Move to upper split |
| `<C-l>` | Move to right split |
| `<leader>sv` | Vertical split |
| `<leader>sh` | Horizontal split |

---

### Editing Quality of Life
| Key | Action |
|------|--------|
| `j` | Move down (visual line aware) |
| `k` | Move up (visual line aware) |
| `J` (visual mode) | Move selection down |
| `K` (visual mode) | Move selection up |

---

### Telescope
| Key | Action |
|------|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | List open buffers |

---

### File Explorer
| Key | Action |
|------|--------|
| `<leader>e` | Toggle file tree |

---

### LSP
| Key | Action |
|------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format file |

---

### Git (gitsigns)
| Key | Action |
|------|--------|
| `]h` | Next git hunk |
| `[h` | Previous git hunk |

---

### Terminal
| Key | Action |
|------|--------|
| `<leader>t` | Toggle integrated terminal |
| `<Esc>` (terminal mode) | Exit terminal mode |

---

### Bufferline
| Key           | Action                |
| ------------- | --------------------- |
| `<S-h>`       | Previous buffer       |
| `<S-l>`       | Next buffer           |
| `<leader>bd`  | Delete current buffer |
| `<leader>bo`  | Close other buffers   |
| `<leader>1-9` | Jump to buffer 1–9    |

