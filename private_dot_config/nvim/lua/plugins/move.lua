return {
  {
    "phaazon/hop.nvim",
    enabled = false,
    event = "BufRead",
    config = function()
      require("hop").setup()
      vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
      vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
    end,
  },
  {
    "ggandor/lightspeed.nvim",
    event = "BufRead",
  },
  {
    "m4xshen/hardtime.nvim",
    -- enabled = false,
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "ThePrimeagen/vim-be-good",
  },
}
