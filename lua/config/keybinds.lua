vim.g.mapleader = " "

-- NeoTree --
vim.keymap.set("n", "<leader>f", function()
	vim.cmd("NvimTreeOpen")
end)
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("NvimTreeClose")
end)
