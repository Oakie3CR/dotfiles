local map = vim.keymap.set

-- better window navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")

-- convenience mappings
map("n", ";", ":")
map("n", "<F1>", "<Esc>")

-- research how to make this work better...
map("n", "<leader>bb", ":bprevious<CR>")

-- fugitive mappings
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gd", ":Gdiffsplit<CR>")
map("n", "<leader>gc", ":Git commit<CR>")
map("n", "<leader>gb", ":Git blame<CR>")
map("n", "<leader>gl", ":Git log<CR>")
map("n", "<leader>gp", ":Git! push<CR>")

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
