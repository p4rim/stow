vim.opt.number = false 
vim.opt.relativenumber = false
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.signcolumn = "no"
vim.opt.showmatch = false
vim.opt.cmdheight = 1
vim.opt.autocomplete = false
vim.opt.showmode = true
vim.opt.laststatus = 2
vim.opt.statusline = "%<%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.opt.shortmess = "filnxtToOS"
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.smoothscroll = true
vim.opt.display = ""
vim.opt.listchars = { eol = "$" }
vim.opt.winblend = 0
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.synmaxcol = 3000
vim.opt.fillchars = { eob = "~" }

vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = "indent,eol,start"
vim.opt.autochdir = false
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.selection = "inclusive"
vim.opt.mouse = "a"
vim.opt.clipboard:append("unnamedplus")
vim.opt.modifiable = true

vim.opt.guicursor = "a:block-blinkwait700-blinkon500-blinkoff500"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.diffopt:append("linematch:60")
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000
