-- This plugin automatically adds bulletpoints on the next line respecting indentation.
--
-- When in insert mode, you can increase indentation with ctrl-t and decrease it with ctrl-d.
--
-- By default it is enabled on filetypes 'markdown', 'text', 'gitcommit' 'scratch'
--
-- https://github.com/bullets-vim/bullets.vim

return {
  "bullets-vim/bullets.vim",
  config = function()
    -- disable deleting the last empty bullet when pressing <cr> or 'o'
    -- default = 1
    vim.g.bullets_delete_last_bullet_if_empty = 1

    -- configuration to avoid a bug with snacks.picker
    -- https://linkarzu.com/posts/neovim/snacks-picker/#bulletsvim-configuration
    vim.g.bullets_enable_in_empty_buffers = 0

    -- just use the - as a bullet levels instead of alternating
    -- default
    --
    -- vim.g.bullets_outline_levels = {
    --   "ROM",
    --   "ABC",
    --   "num",
    --   "abc",
    --   "rom",
    --   "std-",
    --   "std*",
    --   "std+",
    -- }
    vim.g.bullets_outline_levels = {
      "ROM",
      "ABC",
      "num",
      "abc",
      "rom",
      "std-",
    }

    -- (Optional) Add other configurations here
    -- for example, enabling/disabling mappings
    -- vim.g.bullets_set_mappings = 1
  end,
}
