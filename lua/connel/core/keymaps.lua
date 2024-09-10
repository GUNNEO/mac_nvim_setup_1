-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- save and quit the file
keymap.set("n", "<leader>w", "<cmd>w<CR>")
keymap.set("n", "<leader>q", "<cmd>q<CR>")
keymap.set("n", "<leader>wq", "<cmd>wq<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>=", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- file path
keymap.set("n", "<leader>fp", ":echo expand('%:p')<CR>")
vim.api.nvim_create_user_command("Cppath", function()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})
keymap.set("n", "<leader>cf", ":Cppath<CR>")

-- delete .DS_Store file
vim.api.nvim_create_user_command("CleanDSStoreFiles", function()
	-- Find all .DS_Store files recursively
	local current_dir = vim.fn.getcwd()
	local ds_store_files = vim.fn.systemlist("find " .. current_dir .. " -name .DS_Store")
	for _, file in ipairs(ds_store_files) do
		vim.fn.delete(file) -- Delete each .DS_Store file
	end
	vim.notify("Cleaned all .DS_Store files in the current directory.")
end, {})
keymap.set("n", "<leader>ds", ":CleanDSStoreFiles<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<CR>") -- find string in current working directory as you type
keymap.set("n", "<leader>fw", "<cmd>Telescope grep_string<CR>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>") -- list available help tags

-- move between buffers
keymap.set("n", "<leader>bn", "<cmd>:bn<CR>") -- move to the next buffer
keymap.set("n", "<leader>bp", "<cmd>:bp<CR>") -- move to the previous buffer
keymap.set("n", "<leader>bq", "<cmd>:Bdelete<CR>") -- close current buffer but do not close current window
keymap.set("n", "<leader>bd", "<cmd>:bd<CR>")
keymap.set("n", "<leader>bu", "<cmd>:bufdo bdelete<CR>") -- close all buffers but retain current window

-- auto run file
keymap.set("n", "<leader>ll", "<cmd>!lua %<CR>")
keymap.set("n", "<leader>pp", "<cmd>!python3 %<CR>")
keymap.set("n", "<leader>cpp", ":w<CR>:!clang++ -g -arch arm64 % -o %:r && %:r<CR>", { noremap = true, silent = true })

-- DAP
keymap.set("n", "<leader>tb", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
keymap.set("n", "<leader>n", "<cmd>lua require('dap').continue()<CR>")
keymap.set("n", "<leader>/", "<cmd>lua require('dap').step_over()<CR>")
keymap.set("n", "<leader>.", "<cmd>lua require('dap').step_into()<CR>")

-- latex
keymap.set("n", "<leader>lt", "<cmd>VimtexCompile<CR>")
keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>")
keymap.set("n", "<leader>zp", "<cmd>!zathura '%'<CR>")
keymap.set("n", "<leader>op", "<cmd>!open '%'<CR>")

-- leetcode
keymap.set("n", "<leader>lp", "<cmd>Leet list<CR>")
keymap.set("n", "<leader>lr", "<cmd>Leet run<CR>")
keymap.set("n", "<leader>ls", "<cmd>Leet submit<CR>")
