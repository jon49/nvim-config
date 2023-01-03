local opt = vim.opt

opt.nu = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand('~/.vim/undodir')
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

-- opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.iskeyword:append("-")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.textwidth = 80
opt.wrap = false
opt.spell = true

