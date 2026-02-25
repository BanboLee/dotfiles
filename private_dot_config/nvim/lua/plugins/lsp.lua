return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = { "trae-gopls", "-remote=unix;/tmp/gopls-shared.sock" },
          keys = {
            -- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
            -- { "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
          },
          settings = {
            gopls = {
              gofumpt = true,
              codelenses = {
                gc_details = false,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
              },
              hints = {
                -- assignVariableTypes = true,
                -- compositeLiteralFields = true,
                -- compositeLiteralTypes = true,
                constantValues = true,
                -- functionTypeParameters = true,
                -- parameterNames = true,
                -- rangeVariableTypes = true,
              },
              analyses = {
                fieldalignment = false,
                nilness = true,
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
                simplifyslice = true,
                simplifyrange = true,
                simplifycompositelit = true,
                shadow = true,
              },
              usePlaceholders = false,
              completeUnimported = true,
              staticcheck = true,
              directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
              semanticTokens = true,
            },
          },
        },
      },
      setup = {
        rust_analyzer = function()
          return true
        end,
        gopls = function(_, _)
          -- workaround for gopls not supporting semanticTokensProvider
          -- https://github.com/golang/go/issues/54531#issuecomment-1464982242
          Snacks.util.lsp.on({ name = "gopls" }, function(_, client)
            if not client.server_capabilities.semanticTokensProvider then
              local semantic = client.config.capabilities.textDocument.semanticTokens
              client.server_capabilities.semanticTokensProvider = {
                full = true,
                legend = {
                  tokenTypes = semantic.tokenTypes,
                  tokenModifiers = semantic.tokenModifiers,
                },
                range = true,
              }
            end
          end)
          -- end workaround
        end,
        -- Disable copilot
        copilot = function(_, _)
          return true
        end,
      },
    },
  },
}
