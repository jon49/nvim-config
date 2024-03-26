local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  'github/copilot.vim',
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { { "vhyrro/luarocks.nvim" } },
    config = function()
      require("rest-nvim").setup({})
    end
  },

  {
	  'nvim-telescope/telescope.nvim', version = '0.1.x',
	  -- or                            , branch = '0.1.x',
	  dependencies = { { 'nvim-lua/plenary.nvim' } }
  },

  {
	  'rose-pine/neovim',
	  name = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
	  end
  },

  {
      'junegunn/vim-easy-align',
      ft = { 'markdown' }
  },

  {
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts = {
          ensure_installed = { "lua", "javascript", "typescript", "markdown", "http", "json" },
          auto_install = true,
          highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
          },
      }
  },

  'nvim-treesitter/playground',

  'mbbill/undotree',

  'tpope/vim-fugitive',

  {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  },
  {
	  'VonHeikemen/lsp-zero.nvim',
	  dependencies = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  },

  {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
  },

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  }

})

