---@type LazySpec
return {
  -- {
  --   "miversen33/sunglasses.nvim",
  --   config = {
  --     filter_type = "SHADE",
  --     filter_percent = 0.25,
  --     excluded_filetypes = {
  --       "dashboard",
  --       "lspsagafinder",
  --       "packer",
  --       "checkhealth",
  --       "mason",
  --       "NvimTree",
  --       "plugin",
  --       "lazy",
  --       "TelescopePrompt",
  --       "alpha",
  --       "toggleterm",
  --       "sagafinder",
  --       "better_term",
  --       "fugitiveblame",
  --       "starter",
  --       "NeogitPopup",
  --       "NeogitStatus",
  --       "DiffviewFiles",
  --       "DiffviewFileHistory",
  --       "DressingInput",
  --       "spectre_panel",
  --       "zsh",
  --       "registers",
  --       "startuptime",
  --       "OverseerList",
  --       "Outline",
  --       "Navbuddy",
  --       "noice",
  --       "notify",
  --       "saga_codeaction",
  --       "sagarenaname",
  --     },
  --   },
  -- },
  -- require("lazy").setup({"miversen33/sunglasses.nvim", config = true--[[ }) ]]
  {
    "levouh/tint.nvim",

    opts = {
      tint = -25, -- Darken colors, use a positive value to brighten
      saturation = 0.7, -- Saturation to preserve
      tint_background_colors = false, -- Tint background portions of highlight groups
      highlight_ignore_patterns = { "WinSeparator", "Status.*" }, -- Highlight group patterns to ignore, see `string.find`
      window_ignore_function = function(winid)
        local bufid = vim.api.nvim_win_get_buf(winid)
        local buftype = vim.api.nvim_buf_get_option(bufid, "buftype")
        local floating = vim.api.nvim_win_get_config(winid).relative ~= ""

        -- Do not tint `terminal` or floating windows, tint everything else
        return buftype == "terminal" or floating
      end,
    },
  },
  -- {
  --   "TaDaa/vimade",
  --   config = function()
  --     vim.g.vimade = {
  --       enabletreesitter = 1,
  --       normalid = "lel",
  --       normalncid = "lel",
  --       enablefocusfading = 1,
  --       fadelevel = 0.6,
  --       enablesigns = 1,
  --     }
  --   end,
  -- },
}
