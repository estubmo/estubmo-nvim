return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { -- add a new dependency to telescope that is our new plugin
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    -- the first parameter is the plugin specification
    -- the second is the table of options as set up in Lazy with the `opts` key
    config = function(plugin, opts)
      -- run the core AstroNvim configuration function with the options table
      require "astronvim.plugins.configs.telescope"(plugin, opts)

      -- require telescope and load extensions as necessary
      require("telescope").load_extension "media_files"

      require("telescope").setup {
        defaults = {
          layout_strategy = "flex",
          sorting_strategy = "descending",
          layout_config = {
            prompt_position = "bottom",
            -- horizontal = {
            --   prompt_position = "bottom",
            -- },
            -- vertical = {
            --   prompt_position = "bottom",
            -- },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      }
    end,
  },
}
