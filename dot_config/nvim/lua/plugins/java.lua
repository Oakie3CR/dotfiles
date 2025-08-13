return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      table.insert(opts.cmd, "--jvm-arg=-Djava.import.generatesMetadataFilesAtProjectRoot=false")
    end,
  },
  -- This gets rid of the progress messages at the lower right corner of the screen that can be annoying.
  {
    "folke/noice.nvim",
    opts_extend = { "routes" },
    opts = {
      routes = {
        {
          filter = {
            event = "lsp",
            kind = "progress",
            find = "jdtls",
          },
          opts = { skip = true },
        },
      },
    },
  },
  -- Play with this at some point to get java testing to work
  -- { "rcasia/neotest-java" },
  -- {
  --   "nvim-neotest/neotest",
  --   opts = { adapters = { "neotest-java" } },
  -- },
}
