local packer = require("packer")

local function my_startup()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'shaunsingh/nord.nvim'

	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		}
	}

	use {
    	'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
	}

	use {
    	'glacambre/firenvim',
    	run = function() vim.fn['firenvim#install'](0) end 
	}

	-- TODO: Configure
	use {
  	  'phaazon/hop.nvim',
  	  branch = 'v1', -- optional but strongly recommended
  	  config = function()
    	-- you can configure Hop the way you like here; see :h hop-config
    	require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
  	  end
	}

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

	-- TODO: Configure
	use {
  	  'nvim-telescope/telescope.nvim',
  	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
  		'romgrk/barbar.nvim',
  		requires = {'kyazdani42/nvim-web-devicons'}
	}

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'

	use 'windwp/nvim-autopairs'

	use 'rmagatti/auto-session'
end

packer.startup(my_startup)
