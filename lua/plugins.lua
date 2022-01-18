local packer = require("packer")

-- Todo: indent blankline and line numbers too bright

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

	use {
		"easymotion/vim-easymotion",
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
  	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'

	use 'windwp/nvim-autopairs'
	use "nathom/filetype.nvim"
	use 'b3nj5m1n/kommentary'
    use "lukas-reineke/indent-blankline.nvim"

	use {
  		'lewis6991/gitsigns.nvim',
  		requires = {
    		'nvim-lua/plenary.nvim'
  		},
	}

	use "justinmk/vim-sneak"

	use "andymass/vim-matchup"
end

packer.startup(my_startup)
