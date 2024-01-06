return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "folke/neoconf.nvim", cmd = "Neoconf", config = true },
    { "folke/neodev.nvim", opts = { experimental = { pathStrict = true } } },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    { "b0o/schemastore.nvim", version = false },
  },
  opt = {
    servers = {
      lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
              },
              maxPreload = 100000,
              preloadFileSize = 10000,
            },
          },
        },
      },
      jsonls = {
        on_new_config = function(new_config)
          new_config.settings.json.schemas = new_config.settings.json.schemas or {}
          vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
        end,
        settings = {
          json = {
            format = {
              enable = true,
            },
            validate = {
              enable = true,
            },
          }
        }
      }
    },
  },
  config = function()
    -- local map = vim.keymap.set

    -- local mason = require("mason")
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local schemas = require("schemastore").json.schemas()

    -- mason.setup({
    --   ui = {
    --     icons = {
    --       package_installed = "",
    --       package_pending = "",
    --       package_uninstalled = "ﮊ",
    --     },
    --   },
    -- })

    mason_lspconfig.setup({
      ensure_installed = {
        "lua_ls",
      },
      automatic_installation = true,
    })

    local opts = { silent = true }

    local on_attach = function(_, _)
      require("plugins.lsp.shared").mappings()
    end

    mason_lspconfig.setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          on_attach = on_attach,
        })
      end,
      -- ["lua_ls"] = function()
      --   lspconfig.lua_ls.setup({
      --     on_attach = on_attach,
      --     settings = {
      --       Lua = {
      --         runtime = {
      --           version = "LuaJIT",
      --         },
      --         diagnostics = {
      --           globals = { "vim" },
      --         },
      --         workspace = {
      --           library = {
      --             [vim.fn.expand("$VIMRUNTIME/lua")] = true,
      --             [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
      --           },
      --           maxPreload = 100000,
      --           preloadFileSize = 10000,
      --         },
      --       },
      --     },
      --   })
      -- end,
      -- ["jsonls"] = function()
      --   lspconfig.jsonls.setup({
      --     settings = {
      --       json = {
      --         schemas = schemas,
      --         validate = {
      --           enable = true,
      --         },
      --       },
      --     },
      --   })
      -- end,
    })
  end,
}
