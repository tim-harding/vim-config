local packer = require("packer")

local function my_startup()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Chrome plugin
	use {
    	'glacambre/firenvim',
    	run = function() vim.fn['firenvim#install'](0) end
	}

	-- Color scheme
	use 'shaunsingh/nord.nvim'
	use 'rmehri01/onenord.nvim'

	-- Status line
	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		}
	}

	-- File tree
	use {
    	'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
	}

	-- Easymotion plugin
	use {
  	  'phaazon/hop.nvim',
  	  branch = 'v1',
  	  config = function()
    	-- you can configure Hop the way you like here; see :h hop-config
  	  end
	}

	-- Syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	-- TODO: Configure
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'}
		}
	}

	-- Automatic bracket matching
	use 'windwp/nvim-autopairs'

	-- A faster version of the built-in filetype identifier
	use "nathom/filetype.nvim"

	-- <leader>cc for commenting lines
	use 'b3nj5m1n/kommentary'

	-- Indentation guides
    use "lukas-reineke/indent-blankline.nvim"

	-- Puts Git info in the gutter
	use {
  		'lewis6991/gitsigns.nvim',
  		requires = {
    		'nvim-lua/plenary.nvim'
  		},
	}

	-- Extends % to more kinds of tokens
	use "andymass/vim-matchup"

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'

	use 'simrat39/rust-tools.nvim'

	-- Debug adapter protocol for debugging
	use 'mfussenegger/nvim-dap'
end

packer.startup(my_startup)
