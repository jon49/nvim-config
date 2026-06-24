require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here 
  -- with the ones you want to install
  ensure_installed = {
  	'ts_ls',
    'csharp_ls',
    'denols',
    'emmet_language_server',
    'html',
    'lua_ls',
    'v_analyzer',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    -- Deno and ts_ls both claim JS/TS files. Gate each to its own project
    -- marker and disable single-file fallback so denols stops attaching to
    -- Node projects (e.g. game-timer.js) that have no deno.json.
    denols = function()
      require('lspconfig').denols.setup({
        single_file_support = false,
        root_dir = require('lspconfig.util').root_pattern('deno.json', 'deno.jsonc'),
      })
    end,
    ts_ls = function()
      require('lspconfig').ts_ls.setup({
        single_file_support = false,
        root_dir = require('lspconfig.util').root_pattern('package.json', 'tsconfig.json', 'jsconfig.json'),
      })
    end,
  },
})

