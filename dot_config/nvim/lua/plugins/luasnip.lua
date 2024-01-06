return {
  "L3MON4D3/LuaSnip",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    require("luasnip").config.set_config({
      history = true,
      updateevents = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
