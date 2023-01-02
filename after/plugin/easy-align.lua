

local map = vim.keymap
local options = { noremap = false }

map.set("x", "ga", "<Plug>(EasyAlign)", options)
map.set("n", "ga", "<Plug>(EasyAlign)", options)
map.set("n", "gt", "<Plug>(EasyAlign)ip*", options)
map.set("n", "gtc", "<Plug>(EasyAlign)ip<Enter><Enter>*", options)
map.set("n", "gtr", "<Plug>(EasyAlign)ip<Enter>*", options)

