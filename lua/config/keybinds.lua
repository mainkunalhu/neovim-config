vim.g.mapleader = " "

-- NeoTree --
vim.keymap.set("n", "<leader>f", function()
	vim.cmd("NvimTreeOpen")
end)
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("NvimTreeClose")
end)
vim.keymap.set("n", "<C-_>", function()
	require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
