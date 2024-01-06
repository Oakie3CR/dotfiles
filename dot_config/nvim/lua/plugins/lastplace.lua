return {
  "ethanholz/nvim-lastplace",
  opts = {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ingore_filetype = {
      "gitcommit",
      "gitrebase",
      "svn",
      "hgcommit",
    },
    lastplace_open_folds = true,
  },
}
