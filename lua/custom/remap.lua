vim.g.mapleader = " "

local map = vim.keymap

-- Reload config
map.set("n", "<leader>rc", "<cmd>luafile ~/.config/nvim/init.lua<CR>", { desc = "Reload config." })

map.set("n", "-", vim.cmd.Ex, { desc = "Open file explorer." })
-- map.set("n", "<leader>E", ":badd<CR>:Ex<CR>", { desc = "Open file explorer in new buffer." }) This doesn't seem to work?!?!?
map.set("n", "<leader>c", ":bd<CR>", { desc = "Close current buffer." })
map.set("n", "<leader>E", "<C-6>", { desc = "Open file explorer in new buffer." })
map.set("n", "Q", ":wq<CR>", { desc = "Write & quit." })
map.set("n", "<leader>q", ":q<CR>", { desc = "Quit." })
map.set("n", "<leader>w", ":w<CR>", { desc = "Save." })

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
map.set("i", "--", "<C-k>-M")
map.set("i", "---", "--")
map.set("i", "jj", "<ESC>", { desc = "Escape." })

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

-- toggle dark/light mode
map.set("n", "<leader>l", function()
    if vim.o.background == "dark" then
        vim.o.background = "light"
    else
        vim.o.background = "dark"
    end
end)

