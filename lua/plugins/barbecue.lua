return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  event = "VeryLazy",
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {
    include_buftypes = { "" },
    exclude_filetypes = { "gitcommit", "Trouble", "toggleterm", "Spectre" },
  },
}
