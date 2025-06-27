-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', 'gh', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', 'gl', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', 'gj', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', 'gk', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- nvim-tree
vim.keymap.set('n', 'g<space>', '<cmd>NvimTreeToggle<cr>', { desc = 'Toggle nvim-tree' })

-- buffers
vim.keymap.set('n', '<leader>b', ':ls<cr>:b ', { desc = 'list buffers' })
vim.keymap.set('n', '<C-n>', ':bn<cr>', { desc = 'next buffer' })
vim.keymap.set('n', '<C-p>', ':bp<cr>', { desc = 'previous buffer' })

-- git
vim.keymap.set('n', 'gb', '<cmd>Git blame<cr>', { desc = 'git blame toggle' })

-- undotree
vim.keymap.set('n', 'gu', '<cmd>UndotreeToggle<cr>', { desc = 'toggle undotree' })

-- comfort
vim.keymap.set('n', ';', ':', { desc = 'map ; to : for comfort' })
vim.keymap.set('n', 'J', 'gT', { desc = 'previous tab' })
vim.keymap.set('n', 'K', 'gt', { desc = 'next tab' })
