return {
  "windwp/nvim-autopairs",
  dependencies = "hrsh7th/nvim-cmp",
  config = function()
    local cmp = require("cmp")

    require("nvim-autopairs").setup({
      check_tx = true,
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
