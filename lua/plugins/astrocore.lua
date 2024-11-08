-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing
function _G.get_wildmenu_key(key_wildmenu, key_regular)
  return vim.fn.wildmenumode() ~= 0 and key_wildmenu or key_regular
end

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = false, -- enable autopairs at start
      cmp = true, -- enable completion at start
      diagnostics_mode = 3, -- diagnostic mode on start (0 = off, 1 = no signs/virtual text, 2 = no virtual text, 3 = on)
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to yes
        wrap = false, -- sets vim.opt.wrap

        guicursor = "",

        nu = true,

        tabstop = 4,
        softtabstop = 4,
        shiftwidth = 4,
        expandtab = true,

        smartindent = true,

        swapfile = false,
        backup = false,
        undodir = os.getenv "HOME" .. "/.vim/undodir",
        undofile = true,

        hlsearch = false,
        incsearch = true,

        termguicolors = true,

        scrolloff = 10,

        updatetime = 50,

        colorcolumn = "",
      },
      -- g = { -- vim.g.<key>
      -- configure global vim variables (vim.g)
      -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
      -- This can be found in the `lua/lazy_setup.lua` file
      -- },
    },
    autocmds = {
      -- disable alpha autostart
      -- alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        -- ["<C-d>"] = { "<C-d>zz", desc = "which_key_ignore" },
        -- ["<C-u>"] = { "<C-u>zz", desc = "which_key_ignore" },
        ["n"] = { "nzzzv", desc = "which_key_ignore" },
        ["N"] = { "Nzzzv", desc = "which_key_ignore" },
        ["<leader>k"] = { "<cmd>lnext<CR>zz", desc = "which_key_ignore" },
        ["<leader>j"] = { "<cmd>lprev<CR>zz", desc = "which_key_ignore" },

        ["<leader>fe"] = {
          "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "Find words (Args)",
        },
        ["<leader>fH"] = {
          "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
          desc = "Find files (include hidden)",
        },
        ["<leader>fB"] = {
          ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
          desc = "Find files in current path (Browser)",
        },
        ["<CR>"] = { "o<Esc>", desc = "which_key_ignore" },
        ["<S-CR>"] = { "O<Esc>", desc = "which_key_ignore" },
        ["<leader>gv"] = {
          function()
            if next(require("diffview.lib").views) == nil then
              vim.cmd "DiffviewOpen"
            else
              vim.cmd "DiffviewClose"
            end
          end,
          desc = "Toggle Diffview",
        },
        ["<leader>gh"] = {
          "<cmd>DiffviewFileHistory %<CR>",
          desc = "Open Diffview file history for current file",
        },
        ["<leader>s"] = {
          "<cmd>noautocmd w <CR>",
          desc = "Save without formatting",
        },
        ["x"] = {
          '"_x',
          desc = "which_key_ignore",
        },
      },
      i = {
        ["<M-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "which_key_ignore" },
        ["<M-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "which_key_ignore" },
      },
    },
  },
}
