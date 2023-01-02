vim.g.mapleader = " "

local map = vim.keymap

map.set("n", "<leader>e", vim.cmd.Ex, { desc = "Open file explorer." })
-- map.set("n", "<leader>E", ":badd<CR>:Ex<CR>", { desc = "Open file explorer in new buffer." })

map.set("n", "<leader>p", '"+p', { desc = "Paste after from clipboard." })
map.set("n", "<leader>P", '"+P', { desc = "Paste before from clipboard." })

map.set("n", "<leader>s", "vip:sort i<CR>{{jV}}kJ0j", { desc = "Insensitive sort in paragraph and join." })
map.set("n", "<leader>S", "0f@f@hs<CR><CR><ESC>V:s/@/\\r@/g<CR>{dd<ESC>", { desc = "Expand @ tags." })
map.set("i", "<C-d>", function()
    vim.api.nvim_put({ os.date('%Y-%m-%d') }, 'c', false, true)
end)
map.set("i", "<C-t>", function()
    vim.api.nvim_put({ os.date('%Y-%m-%d - %H:%M') }, 'c', false, true)
end)

-- Keep cursor in the middle
map.set("n", "<C-d>", "<C-d>zz")
map.set("n", "<C-u>", "<C-u>zz")
map.set("n", "n", "nzzzv")
map.set("n", "N", "Nzzzv")

-- map.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- map.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- When pasting over another item keep previous item in register
map.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map.set({"n", "v"}, "<leader>y", [["+y]])
map.set("n", "<leader>Y", [["+Y]])

map.set("n", "Q", "<nop>")
map.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map.set("n", "<leader>f", vim.lsp.buf.format)

map.set("n", "<Tab>", ":bnext<CR>")
map.set("n", "<S-Tab>", ":bprev<CR>")
map.set("n", "<leader>k", "<cmd>lnext<CR>zz")
map.set("n", "<leader>j", "<cmd>lprev<CR>zz")
map.set("n", "<C-h>", "<C-w>h")
map.set("n", "<C-l>", "<C-w>l")
map.set("n", "<C-k>", "<C-w>k")
map.set("n", "<C-j>", "<C-w>j")

map.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map.set("n", "<Down>", "<C-w>-")
map.set("n", "<Up>", "<C-w>+")
map.set("n", "<Right>", "<C-w>>")
map.set("n", "<Left>", "<C-w><")

