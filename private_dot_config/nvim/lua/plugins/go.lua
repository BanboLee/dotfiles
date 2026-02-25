local ts = require("util.ts")
return {
  {
    "fatih/vim-go",
    dependencies = {
      "SirVer/ultisnips",
    },
    enabled = false,
  },
  {
    "yanskun/gotests.nvim",
    -- dir = "~/project/gotests.nvim",
    -- dev = true,
    ft = "go",
    config = function()
      local cmd = {
        name = "AddFunctionTest",
        cmd = function()
          local pos = ts.get_func_range()
          if not pos then
            vim.notify("Get golang function range failed", vim.log.levels.ERROR)
            return
          end
          require("gotests.autoload").tests(pos.start_line, pos.end_line)
        end,
        opt = {},
      }
      vim.api.nvim_create_user_command(cmd.name, cmd.cmd, cmd.opt)
      require("gotests").setup()
    end,
  },
  {
    "fredrikaverpil/neotest-golang",
  },
  {
    "leoluz/nvim-dap-go",
    -- enabled = false,
    config = true,
  },
  {
    enabled = false,
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup({
        gotests_template = "testify",
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod", "gosum", "gowork" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "crispgm/nvim-go",
    enabled = false,
    config = function()
      require("go").setup({})
    end,
  },
}
