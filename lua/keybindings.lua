-- Escapes codes such as <C-n> and <Tab>
local function t(string)
	-- https://neovim.io/doc/user/api.html#nvim_replace_termcodes()
	return vim.api.nvim_replace_termcodes(string, true, true, true)
end

local function keybindings()
	-- Operator-pending would be, for example, when you've typed 
	-- 'y' before executing 'yw'
	--
	-- Select mode is rarely used for anything other than snippet engines
	--
	-- More details here: https://github.com/nanotee/nvim-lua-guide#defining-mappings
	local Mode = {
		-- Normal, visual, select, operator-pending
		-- :map
		all = "",
		-- :nmap
		normal = "n",
		-- :vmap
		visual_and_select = "v",
		select_ = "s",
		visual = "x",
		operator_pending = "o",
		-- map!
		insert_and_command = "!",
		-- imap
		insert = "i",
		insert_and_command_and_lang_arg = "l",
		command_line = "c",
		terminal = "t",
	}

	-- If `expr = true`, the command evaluates to some
	-- string that then is executed. This allows for 
	-- different mapping behaviors based on context.
	local remap_settings = {
		noremap = true,
		silent = true,
	}

	-- Do I need to return a function from my modules and 
	-- call it in order to get hot-reload? Why does re-sourcing
	-- not update my key bindings?

	-- Easier buffer switching
	vim.api.nvim_set_keymap(
		Mode.normal, 
		"<Leader><Leader>",
		"<C-^>",
		remap_settings
	)

	-- " Use normal paste command
	-- " imap <C-v> <Esc>"+pa
	-- 
	-- " " Copy to clipboard
	-- vnoremap  <leader>y  "+y
	-- nnoremap  <leader>Y  "+yg_
	-- nnoremap  <leader>y  "+y
	-- nnoremap  <leader>yy  "+yy
	-- 
	-- " " Paste from clipboard
	-- nnoremap <leader>p "+p
	-- nnoremap <leader>P "+P
	-- vnoremap <leader>p "+p
	-- vnoremap <leader>P "+P
	-- 
	-- " Resizing panes
	-- nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
	-- nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
	-- 
	-- " Moving between panes
	-- nnoremap <leader><Down> <C-W><C-J>
	-- nnoremap <leader><Up> <C-W><C-K>
	-- nnoremap <leader><Left> <C-W><C-H>
	-- nnoremap <leader><Right> <C-W><C-L>
	-- 
	-- " Close braces automatically
	-- imap {<CR> {<CR>}<Esc>O
	-- imap [<CR> [<CR>]<Esc>O
	-- imap (<CR> (<CR>)<Esc>O
	-- 
	-- " Fix indentation on selection
	-- nmap <leader>= gg=G<C-O>
	-- 
	-- 
	-- 
	-- 
	-- " ----------------------------------------------------------
	-- "  LSP
	-- " ----------------------------------------------------------
	-- 
	-- " Code navigation shortcuts
	-- nnoremap gh     <cmd>lua vim.lsp.buf.hover()<CR>
	-- nnoremap gi    <cmd>lua vim.lsp.buf.implementation()<CR>
	-- nnoremap gH 	<cmd>lua vim.lsp.buf.signature_help()<CR>
	-- nnoremap gr    <cmd>lua vim.lsp.buf.references()<CR>
	-- nnoremap g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
	-- nnoremap gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	-- nnoremap gd    <cmd>lua vim.lsp.buf.definition()<CR>
	-- nnoremap gD   	<cmd>lua vim.lsp.buf.type_definition()<CR>
	-- nnoremap ga    <cmd>lua vim.lsp.buf.code_action()<CR>
	-- 
	-- " Goto previous/next diagnostic warning/error
	-- nnoremap <silent> g[ <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
	-- nnoremap <silent> g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
	-- 
	-- " Show diagnostic popup on cursor hold
	-- autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics()
end

return keybindings
