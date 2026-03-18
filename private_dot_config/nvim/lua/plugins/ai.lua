return {
  {
    "folke/sidekick.nvim",
    -- enabled = false,
    lazy = true,
    keys = {
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle({ focus = true, filter = { installed = true } })
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select({ filter = { installed = true } })
        end,
        desc = "Select CLI",
      },
    },
  },
}
