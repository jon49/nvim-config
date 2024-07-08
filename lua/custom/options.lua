local opt = vim.opt

if vim.fn.isdirectory(vim.fn.expand("~/AppData/Local/nvim")) == 1 then
    vim.o.shell = vim.fn.expand("C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe")
end

opt.nu = true

opt.bg = "dark"

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

opt.scrolloff = 2
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.iskeyword:append("-")

opt.updatetime = 50

opt.colorcolumn = "80"

opt.textwidth = 80
opt.wrap = false
opt.spell = true

