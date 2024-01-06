return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "arkav/lualine-lsp-progress",
  },
  lazy = true,
  event = "BufReadPre",
  config = function()
    local fn = vim.fn

    local function search_result()
      local res = fn.searchcount({ maxcount = -1, recompute = 1 })

      if vim.v.hlsearch == 0 then
        return ""
      end

      local last_search = fn.getreg("/")
      if not last_search or last_search == "" then
        return ""
      end

      if res.total > 0 then
        return last_search .. "(" .. res.current .. "/" .. res.total .. ")"
      else
        return ""
      end
    end

    require("lualine").setup({
      options = {
        theme = "auto",
      },
      sections = {
        lualine_c = { "filename", "lsp_progress" },
        lualine_x = { search_result, "filetype" },
      },
    })
  end,
}
