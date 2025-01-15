-- I added this to get the 'supertab' experience (where you can tab through the selections)
-- and to turn off auto completion (where it would start completing after a comma and was annoying)
-- https://github.com/LazyVim/LazyVim/discussions/5152
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<S-Tab"] = { "select_prev", "fallback" }, -- I don't know why this doesn't work...
      ["<Tab>"] = { "select_next", "fallback" },
    },
    -- maybe optional
    completion = {
      trigger = {
        show_on_keyword = false,
      },
    },
  },
}
