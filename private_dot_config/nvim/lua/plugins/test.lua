return {
  {
    "andythigpen/nvim-coverage",
    requires = "nvim-lua/plenary.nvim",
    event = "VimEnter",
    opts = function(_, opts)
      opts.auto_load = true
      opts.auto_reload_timeout_ms = 1000
      opts.commands = true
      opts.lang = {
        ["go"] = {
          coverage_file = function()
            local cov_file = vim.fn.getcwd() .. "/coverage.out"
            -- vim.notify("cov_file: " .. cov_file, vim.log.levels.WARN)
            return cov_file
          end,
        },
      }
    end,
    keys = {
      {
        "<leader>tc",
        function()
          local cov = require("coverage")
          cov.toggle()
        end,
        desc = "Toggle coverage",
      },
      {
        "<leader>tL",
        function()
          local cov = require("coverage")
          cov.load(true)
        end,
        desc = "Load coverage",
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      {
        "nvim-treesitter/nvim-treesitter",
        build = function()
          vim.cmd(":TSUpdate go")
        end,
      },
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
        end,
      },
    },
    opts = {
      output = { open_on_run = false },
      quickfix = { open = function() end },
      adapters = {
        ["neotest-golang"] = {
          runner = "gotestsum",
          -- Here we can set options for neotest-golang, e.g.
          go_test_args = function()
            local cwd = vim.fn.getcwd()
            -- vim.notify("cwd: " .. cwd, vim.log.levels.WARN)
            return {
              "-v",
              "-race",
              "-count=1",
              "-gcflags=all=-l -N",
              "-ldflags=-linkmode=external",
              "-timeout=300s",
              "-coverprofile=" .. cwd .. "/coverage.out",
            }
          end,
          log_level = vim.log.levels.DEBUG,
        },
      },
    },
  },
}
