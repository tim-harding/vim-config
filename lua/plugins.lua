local packer = require("packer")

function my_startup()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'shaunsingh/nord.nvim'

	-- TODO: Configure
	use {
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		}
	}

	-- TODO: Configure
	use {
    	'kyazdani42/nvim-tree.lua',
    	requires = 'kyazdani42/nvim-web-devicons',
    	config = function() require'nvim-tree'.setup {} end
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

	-- TODO: Configure
	use {
  	  'nvim-telescope/telescope.nvim',
  	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	use 'neovim/nvim-lspconfig'
	-- Completion framework
	use 'hrsh7th/nvim-cmp'
	-- LSP completion source for nvim-cmp
	use 'hrsh7th/cmp-nvim-lsp'

	-- See hrsh7th's other plugins for more completion sources!

	-- To enable more of the features of rust-analyzer, such as inlay hints and more!
	-- use 'simrat39/rust-tools.nvim'
end

packer.startup(my_startup)
