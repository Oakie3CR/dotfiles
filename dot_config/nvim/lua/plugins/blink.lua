-- I added this to get the 'supertab' experience (where you can tab through the selections)
-- and to turn off auto completion (where it would start completing after a comma and was annoying)
-- https://github.com/LazyVim/LazyVim/discussions/5152
-- I'm also using the main branch instead of the latest released so the documentation section would work
-- If 0.7.7 includes the fix, then I should change the setting in [lua/config/options.lua]
return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab"] = { "select_prev", "fallback" },
    },
    -- maybe optional
    completion = {
      -- list = {
      --   selection = "auto_insert",
      -- },
      documentation = {
        auto_show = false,
      },
    },
  },
}
