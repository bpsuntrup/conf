-- this is a comment. This is my nvim config. I might like this better than emacs
--


vim.opt.number = true
vim.opt.mouse = 'a'
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

vim.keymap.set('n', ';', ':')
