return {
  {
    "folke/lazy.nvim",
    version = false,
  },
  {
    "LazyVim/LazyVim",
    version = false,
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
    },
  },
  {
    "ahmedkhalf/project.nvim",
    opts = {
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "go.mod" },
      detection_methods = { "lsp", "pattern" },
    },
  },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.preset = "classic"
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true, size = 5 * 1024 * 1024, line_length = 3000 },
      dashboard = {
        width = 60,
        sections = function()
          local header = [[
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
          local function greeting()
            -- local hour = tonumber(vim.fn.strftime("%H"))
            -- -- [02:00, 10:00) - morning, [10:00, 18:00) - day, [18:00, 02:00) - evening
            -- local part_id = math.floor((hour + 6) / 8) + 1
            -- local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]
            local username = "Banbo"
            return ("Hi, %s"):format(username)
          end

          -- stylua: ignore
          return {
            { padding = 0, align = "center", text = { header, hl = "header" } },
            { padding = 2, align = "center", text = { greeting(), hl = "header" } },
            { title = "Builtin Actions", indent = 2, padding = 1,
              -- { icon = " ", key = "f", desc = "Find File",       action = ":lua Snacks.dashboard.pick('files')" },
              { icon = " ", key = "s", desc = "restore last session",       action = "<leader>ql" },
              { icon = " ", key = "S", desc = "select session",       action = "<leader>qS" },
              { icon = " ", key = "c", desc = "Config",            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
              { icon = " ", key = "q", desc = "Quit",            action = ":qa" },
            },
            { title = "Maintenance Actions", indent = 2, padding = 2,
              { icon = " ", key = "p", desc = "Projects",    action = require("util.projects").projects },
              { icon = "󰒲 ", key = "l", desc = "Lazy",        action = ":Lazy" },
              { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
              { icon = "󱁤 ", key = "m", desc = "Mason",       action = ":Mason" },
            },
            { section = "startup" },
          }
        end,
      },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      explorer = { replace_netrw = true },
      notifier = { enabled = true, timeout = 3000 },
      quickfile = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
      scope = { enabled = true },
      image = { enabled = true },
      toggle = { enabled = true, map = LazyVim.safe_keymap_set },
    },
  },
  {
    "mfussenegger/nvim-dap",
  },
}
