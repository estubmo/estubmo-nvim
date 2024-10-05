-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.completion/copilot-cmp" },
  { import = "astrocommunity.diagnostics/trouble-nvim" },
  { import = "astrocommunity.editing-support/rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support/undotree" },
  { import = "astrocommunity.editing-support/vim-move" },
  { import = "astrocommunity.git/diffview-nvim" },
  { import = "astrocommunity.git/git-blame-nvim" },
  { import = "astrocommunity.git/neogit" },
  { import = "astrocommunity.lsp/ts-error-translator-nvim" },
  { import = "astrocommunity.motion/marks-nvim" },
  { import = "astrocommunity.motion/mini-ai" },
  { import = "astrocommunity.pack/tailwindcss" },
  { import = "astrocommunity.search/nvim-spectre" },
  { import = "astrocommunity.pack/typescript" },
  { import = "astrocommunity.bars-and-lines/scope-nvim" },
  { import = "astrocommunity.quickfix/nvim-bqf" },
  { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  { import = "astrocommunity.recipes.telescope-lsp-mappings" },
  { import = "astrocommunity.recipes.vscode" },
  { import = "astrocommunity.recipes.vscode-icons" },
  { import = "astrocommunity.scrolling/neoscroll-nvim" },
  { import = "astrocommunity.scrolling/satellite-nvim" },
  { import = "astrocommunity.utility/noice-nvim" },
  { import = "astrocommunity.utility/telescope-live-grep-args-nvim" },
  {
    "copilot-cmp",
    opts = function(_, opts)
      opts.suggestions = true
      opts.panel = { enable = true }
      return opts
    end,
  },
  {
    "noice.nvim",
    opts = function(_, opts)
      opts.presets.bottom_search = false
      opts.lsp.signature = { enabled = true }
      return opts
    end,
  },
}
