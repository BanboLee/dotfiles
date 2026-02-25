return {
  {
    "mason-org/mason.nvim",
    version = false,
    -- enabled = false,
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        -- golang
        "gomodifytags",
        "impl",
        -- "gofumpt",
        "goimports",
        "golines",
        "goimports-reviser",
        "delve",
        "codelldb",
        "gopls",
        "gotests",
        -- python
        "pyright",
        "ruff",
        -- "ruff-lsp",
        "black",
        -- "reorder-python-imports",
        "typos-lsp",
      })
      opts.pip = {
        upgrade_pip = false,
        install_args = {
          "-i",
          "https://pypi.org/simple",
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    -- branch = "feat/find_correct_gomod",
    opts = function(_, opts)
      opts.linters.sqlfluff = {
        args = {
          "lint",
          "--format=json",
          "--dialect=mysql",
          "-e LT05",
        },
      }
      opts.linters_by_ft.markdown = {}
      -- opts.linters_by_ft.go = {
      --   "golangcilint",
      --   args = {
      --     -- "-D staticcheck",
      --   },
      -- }
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters.sql_formatter = {
        args = {
          '-c {"language":"mysql","dialect":"mysql","tabWidth":4,"useTabs":false,"keywordCase":"preserve","dataTypeCase":"lower","functionCase":"preserve","identifierCase":"preserve","indentStyle":"preserve","logicalOperatorNewline":"before","expressionWidth":50,"linesBetweenQueries":1,"denseOperators":true,"newlineBeforeSemicolon":false}',
        },
      }
      opts.formatters_by_ft = {
        go = { "goimports-reviser", "golines" },
        -- go = { "goimports-reviser", "goimports" },
        sh = { "shfmt" },
        lua = { "stylua" },
        python = { "ruff" },
        sql = { "sql_formatter" },
        rust = { "rustfmt" },
        yaml = { "prettier" },
        json = { "prettier" },
      }
      -- opts.format_on_save = {
      --   timeout_ms = 500,
      --   lsp_format = "fallback",
      -- }
      opts.formatters.golines = {
        args = {
          "-m120",
        },
      }
    end,
  },
  {
    "saghen/blink.cmp",
    dependencies = {},
    opts = {
      completion = {
        -- trigger = { prefetch_on_insert = false },
        documentation = { window = { border = "single" } },
        menu = {
          border = "single",
          draw = {
            columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
          },
        },
      },
      signature = { window = { border = "single" } },
      sources = {
        providers = {
          snippets = {
            should_show_items = function(ctx)
              return ctx.trigger.initial_kind ~= "trigger_character"
            end,
          },
        },
      },
    },
  },
  {
    "esmuellert/codediff.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    cmd = "CodeDiff",
  },
}
