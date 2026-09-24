-- I have this here to stop mini.pairs from making pairs in the command line and in the terminal. It can be a pain.
return {
  "nvim-mini/mini.pairs",
  opts = {
    modes = {
      command = false,
      terminal = false,
    },
  },
}
