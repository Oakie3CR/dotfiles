return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      graphql = {
        cmd = { "/Users/christian.rigdon/sandbox/third_party/graphiql/packages/graphql-language-service-cli/bin/graphql.js", "server", "-m", "stream" }
      },
    },
  },
}
