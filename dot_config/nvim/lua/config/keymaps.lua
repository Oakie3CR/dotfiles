local map = vim.keymap.set

-- convenience mappings
map("n", ";", ":")

-- I like having <S-h> go to the top of the screen and <S-l> go to the bottom of the screen
-- I'll get used to the `[b` and `]b` commands
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")
map("n", "<F1>", "<Esc>")

-- I remap <C-a> and <C-x> to alternates becasue <C-a> conflicts with multipluxer command in wezterm
map({ "n", "v" }, "<M-a>", "<C-a>")
map({ "n", "v" }, "<M-x>", "<C-x>")

-- neovide doesn't have these set by default like the terminal does
if vim.g.neovide then
  vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
  vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
end
