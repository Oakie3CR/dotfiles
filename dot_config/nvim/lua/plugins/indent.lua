return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      -- char = "|",
    },
    exclude = {
      filetypes = {
        "help",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "nvchad_cheatsheet",
        "lsp-installer",
        "",
      },
    },
  },
}
