return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        graphql = {
          mason = false,
          cmd = { "rover", "lsp", "--supergraph-config", ".apollo/supergraph.yml" },
        },
      },
    },
  },
}
