local map = vim.keymap.set

-- convenience mappings
map("n", ";", ":")

-- I like having <S-h> go to the top of the screen and <S-l> go to the bottom of the screen
-- I'll get used to the `[b` and `]b` commands
vim.keymap.del("n", "<S-h>")
vim.keymap.del("n", "<S-l>")

-- Start lazy color scheme picker
local telescope = require("telescope.builtin")
local function openColorschemePickerWithEvent()
  -- Trigger the User LazyColorscheme event
  vim.cmd("doautocmd User LazyColorscheme")
  -- Then open the colorscheme picker
  telescope.colorscheme({ enable_preview = true })
end
-- Set the keymap to call the function
map("n", "<leader>uC", openColorschemePickerWithEvent, { desc = "Colorscheme with preview" })
-- End lazy color scheme picker
