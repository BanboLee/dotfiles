return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 2000,
    opts = function(_, opts)
      opts.highlight_overrides = {
        all = function(colors)
          return {
            CurSearch = { bg = colors.sky },
            IncSearch = { bg = colors.sky },
            LineNr = { fg = colors.overlay1 },
            CursorLineNr = { fg = colors.flamingo, style = { "bold" } },
            DashboardFooter = { fg = colors.overlay0 },
            TreesitterContextBottom = { style = {} },
            WinSeparator = { fg = colors.overlay0, style = { "bold" } },
            ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
            ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
            Headline = { style = { "bold" } },
            Headline1 = { fg = colors.blue, style = { "bold" } },
            Headline2 = { fg = colors.pink, style = { "bold" } },
            Headline3 = { fg = colors.lavender, style = { "bold" } },
            Headline4 = { fg = colors.green, style = { "bold" } },
            Headline5 = { fg = colors.peach, style = { "bold" } },
            Headline6 = { fg = colors.flamingo, style = { "bold" } },
            rainbow1 = { fg = colors.blue, style = { "bold" } },
            rainbow2 = { fg = colors.pink, style = { "bold" } },
            rainbow3 = { fg = colors.lavender, style = { "bold" } },
            rainbow4 = { fg = colors.green, style = { "bold" } },
            rainbow5 = { fg = colors.peach, style = { "bold" } },
            rainbow6 = { fg = colors.flamingo, style = { "bold" } },
            MatchParen = { fg = colors.yellow, style = { "bold" } },
            -- code parse
            Comment = { fg = colors.overlay2, style = { "italic" } },
            -- Identifier = { fg = colors.pink },
          }
        end,
      }
      opts.color_overrides = {
        mocha = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#AD6FF7",
          mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#FACA64",
          green = "#70CF67",
          teal = "#4CD4BD",
          sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#00AFFF",
          lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F314D",
          surface0 = "#1D1E29",
          -- base = "",
          mantle = "#11111a",
          crust = "#191926",
        },
        macchiato = {
          rosewater = "#F5B8AB",
          flamingo = "#F29D9D",
          pink = "#AD6FF7",
          mauve = "#FF8F40",
          red = "#E66767",
          maroon = "#EB788B",
          peach = "#FAB770",
          yellow = "#FACA64",
          green = "#70CF67",
          teal = "#4CD4BD",
          sky = "#61BDFF",
          sapphire = "#4BA8FA",
          blue = "#00AFFF",
          lavender = "#00BBCC",
          text = "#C1C9E6",
          subtext1 = "#A3AAC2",
          subtext0 = "#8E94AB",
          overlay2 = "#7D8296",
          overlay1 = "#676B80",
          overlay0 = "#464957",
          surface2 = "#3A3D4A",
          surface1 = "#2F314D",
          surface0 = "#1D1E29",
          -- base = "",
          mantle = "#11111a",
          crust = "#191926",
        },
      }
      opts.integrations.snacks = {
        enabled = true,
        indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
      }
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterViolet",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterYellow",
          "RainbowDelimiterCyan",
          "RainbowDelimiterRed",
        },
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = function(_, opts)
      opts.options.theme = "palenight"
      opts.sections.lualine_z = {
        function()
          return "Think twice & Code once"
        end,
        "os.date('%H:%M')",
      }
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    opts = function(_, opts)
      opts.heading.enabled = true
      opts.heading.sign = true
      opts.heading.position = "inline"
      opts.heading.border = false
      opts.heading.border_virtual = false
      opts.heading.width = "block"
      opts.heading.icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " }
      -- The 'level' is used to index into the list using a clamp
      -- Highlight for the heading icon and extends through the entire line
      opts.heading.backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      }
      -- The 'level' is used to index into the list using a clamp
      -- Highlight for the heading and sign icons
      opts.heading.foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2",
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      }
    end,
  },
}
