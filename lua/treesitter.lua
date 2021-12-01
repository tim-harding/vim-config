-- Use to install new languages for highlighting:
-- :TSInstall <language_to_install>

require('nvim-treesitter.configs').setup {
  	ensure_installed = "all",
  	highlight = {
    	enable = true,
  	},
}
