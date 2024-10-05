return {
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorsscheme = "one_monokai",
    },
  },
  {
    {
      "cpea2506/one_monokai.nvim",
      opts = {
        italics = true,
        colors = {
          darker_grey = "#24272e",
          hint = "#4AC2B8",
        },
        -- transparent = true,
        themes = function(colors)
          local config = require "one_monokai.config"

          return {
            Italic = { italic = true },
            Bold = { bold = true },
            WinBar = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg },
            WinBarNC = { link = "WinBar" },
            NormalFloat = {
              bg = colors.darker_grey,
            },
            StatusLine = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg }, -- status line of current window
            StatusLineNC = { fg = colors.pink, bg = colors.orange }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            TabLineFill = { bg = config.transparent and colors.none or colors.darker_grey }, -- tab pages line, where there are no labels
            TelescopeMatching = { fg = colors.aqua, bg = colors.none },
            TelescopeSelection = { bg = colors.gray },
            DiagnosticHint = { fg = colors.hint },
            DiagnosticInfo = { fg = colors.blue },
            DiagnosticUnderlineError = { sp = colors.red, undercurl = true },
            DiagnosticUnderlineHint = { sp = colors.hint, undercurl = true },
            DiagnosticUnderlineInfo = { sp = colors.blue, undercurl = true },
            DiagnosticUnderlineWarn = { sp = colors.yellow, undercurl = true },
            DiagnosticUnderlineOk = { sp = colors.green, undercurl = true },
          }
        end,
      },
    },
  },
}
