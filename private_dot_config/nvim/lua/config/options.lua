-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local vo = vim.opt
vo.spell = true
vo.cmdheight = 1 -- more space in the neovim command line for displaying messages
vo.guifont = "monospace:h17" -- the font used in graphical neovim applications
vo.autowrite = true -- Enable auto write
vo.clipboard = "unnamedplus" -- Sync with system clipboard
vo.completeopt = "menu,menuone,noselect"
vo.conceallevel = 3 -- Hide * markup for bold and italic
vo.confirm = true -- Confirm to save changes before exiting modified buffer
vo.cursorline = true -- Enable highlighting of the current line
vo.expandtab = true -- Use spaces instead of tabs
vo.formatoptions = "jcroqlnt" -- tcqj
vo.grepformat = "%f:%l:%c:%m"
vo.grepprg = "rg --vimgrep"
vo.ignorecase = true -- Ignore case
vo.inccommand = "nosplit" -- preview incremental substitute
vo.laststatus = 3
vo.list = true -- Show some invisible characters (tabs...
vo.mouse = "a" -- Enable mouse mode
vo.number = true -- Print line number
vo.pumblend = 10 -- Popup blend
vo.pumheight = 10 -- Maximum number of entries in a popup
vo.relativenumber = true -- Relative line numbers
vo.scrolloff = 4 -- Lines of context
vo.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
vo.shiftround = true -- Round indent
vo.shiftwidth = 4 -- Size of an indent
vo.showmode = false -- Dont show mode since we have a statusline
vo.sidescrolloff = 8 -- Columns of context
vo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vo.smartcase = true -- Don't ignore case with capitals
vo.smartindent = true -- Insert indents automatically
vo.spelllang = { "en", "cjk" }
vo.splitbelow = true -- Put new windows below current
vo.splitright = true -- Put new windows right of current
vo.tabstop = 4 -- Number of spaces tabs count for
vo.termguicolors = true -- True color support
vo.timeoutlen = 200
vo.undofile = true
vo.undolevels = 10000
vo.updatetime = 200 -- Save swap file and trigger CursorHold
vo.wildmode = "longest:full,full" -- Command-line completion mode
vo.winminwidth = 5 -- Minimum window width
vo.wrap = false -- Disable line wrap
vo.shortmess:append({ W = true, I = true, c = true })
vo.guicursor = "n-v-sm:block-blinkon200,c-i-ci-ve:ver25-blinkon200,r-cr-o:hor20"
-- vo.guicursor = "a:ver25"
-- vim.g.lazyvim_python_lsp = "basedpyright"
-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"
