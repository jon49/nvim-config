local lsp = require('lsp-zero')

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = {buffer = event.buf}

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'grf', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
  vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
  end,
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<Enter>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- disable completion with tab
        -- this helps with copilot setup
        ['<Tab>'] = nil,
        ['<S-Tab>'] = nil
    })
})

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})


-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki
-- Autocompletion settings of "nvim-cmp" are defined in plugins/nvim-cmp.lua

-- local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
-- if not lsp_status_ok then
--   return
-- end
--
-- local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
-- if not cmp_status_ok then
--   return
-- end
--
-- -- Add additional capabilities supported by nvim-cmp
-- -- See: https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
--
-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   --vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
--
--   -- Highlighting references.
--   -- See: https://sbulav.github.io/til/til-neovim-highlight-references/
--   -- for the highlight trigger time see: `vim.opt.updatetime`
--   if client.server_capabilities.documentHighlightProvider then
--       vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
--       vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
--       vim.api.nvim_create_autocmd("CursorHold", {
--           callback = vim.lsp.buf.document_highlight,
--           buffer = bufnr,
--           group = "lsp_document_highlight",
--           desc = "Document Highlight",
--       })
--       vim.api.nvim_create_autocmd("CursorMoved", {
--           callback = vim.lsp.buf.clear_references,
--           buffer = bufnr,
--           group = "lsp_document_highlight",
--           desc = "Clear All the References",
--       })
--   end
--
--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-shift-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', 'grn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'grf', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end
--
-- -- Diagnostic settings:
-- -- see: `:help vim.diagnostic.config`
-- -- Customizing how diagnostics are displayed
-- vim.diagnostic.config({
--   update_in_insert = true,
--   float = {
--     focusable = false,
--     style = "minimal",
--     border = "rounded",
--     source = "always",
--     header = "",
--     prefix = "",
-- 	},
-- })
--
-- -- Show line diagnostics automatically in hover window
-- -- vim.cmd([[
-- --   autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- -- ]])
--
-- -- Mappings.
-- -- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- local opts = { noremap=true, silent=true }
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
-- -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
--
-- --[[
-- Language servers setup:
--
-- For language servers list see:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--
-- Language server installed:
--
-- Bash          -> bashls
-- Python        -> pyright
-- C-C++         -> clangd
-- HTML/CSS/JSON -> vscode-html-languageserver
-- JavaScript/TypeScript -> ts_ls
-- --]]
--
-- -- Define `root_dir` when needed
-- -- See: https://github.com/neovim/nvim-lspconfig/issues/320
-- -- This is a workaround, maybe not work with some servers.
-- local root_dir = function()
--   return vim.fn.getcwd()
-- end
--
-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches.
-- -- Add your language server below:
-- local servers = { 'bashls', 'pyright', 'clangd', 'html', 'cssls', 'ts_ls' }
--
-- -- Call setup
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     root_dir = root_dir,
--     capabilities = capabilities,
--     flags = {
--       -- default in neovim 0.7+
--       debounce_text_changes = 150,
--     }
--   }
-- end
--
