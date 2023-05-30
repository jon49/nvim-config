local map = vim.keymap

map.set("n", "<leader>rr", "<Plug>RestNvim", { desc = "Send current line or selection to REST client." })
map.set("n", "<leader>rp", "<Plug>RestNvimPreview", { desc = "Preview request." })
map.set("n", "<leader>rl", "<Plug>RestNvimLast", { desc = "Repeat last request." })
map.set("n", "<leader>rb", "<Plug>RestNvimBrowse", { desc = "Browse request history." })
map.set("n", "<leader>re", ":RestSelectEnv ", { desc = "Select environment." })
map.set("n", "<leader>rv", "<Plug>RestNvimVerbose", { desc = "Toggle verbose mode." })

