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
        },
        -- transparent = true,
        themes = function(colors)
          local config = require "one_monokai.config"

          return {
            Italic = { italic = true },
            Bold = { bold = true },
            WinBar = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg },
            WinBarNC = { link = "WinBar" },
            StatusLine = { fg = colors.fg, bg = config.transparent and colors.none or colors.bg }, -- status line of current window
            StatusLineNC = { fg = colors.pink, bg = colors.orange }, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            TabLineFill = { bg = config.transparent and colors.none or colors.darker_grey }, -- tab pages line, where there are no labels
            TelescopeMatching = { fg = colors.aqua, bg = colors.none, },
            TelescopeSelection = {bg  = colors.gray, },
          }
        end,
      },
    },
  },
}
