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
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      n = {
        ["<C-d>"] = { "<C-d>zz", desc = "which_key_ignore" },
        ["<C-u>"] = { "<C-u>zz", desc = "which_key_ignore" },
        ["n"] = { "nzzzv", desc = "which_key_ignore" },
        ["N"] = { "Nzzzv", desc = "which_key_ignore" },
        ["<leader>k"] = { "<cmd>lnext<CR>zz", desc = "which_key_ignore" },
        ["<leader>j"] = { "<cmd>lprev<CR>zz", desc = "which_key_ignore" },

        -- keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
        ["<leader>fg"] = {
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
        -- nnoremap <Leader>L "ayiwOconsole.log('<C-R>a:', <C-R>a);<Esc>
        -- ["<leader>L"] = { "ayiwoconsole.log('<C-R>a:', <C-R>a);<Esc>", desc = "Console.log word under cursor" },
        ["<leader>gv"] = { 
          function()
            if next(require('diffview.lib').views) == nil then
              vim.cmd('DiffviewOpen')
            else
              vim.cmd('DiffviewClose')
            end
          end,
          desc = "Toggle Diffview" },
        
         ["<leader>fv"] =  {
          function()
            if (vim.api.nvim_buf_get_option(0, "filetype")=="netrw")
            then vim.api.nvim_exec("close", false) 
            else vim.api.nvim_exec(":Vexplore", false) 
            end
          end,
          desc = "Toggle file explorer",
          }
      },
      i = {
        ["<M-j>"] = { "<Esc>:m .+1<CR>==gi", desc = "which_key_ignore" },
        ["<M-k>"] = { "<Esc>:m .-2<CR>==gi", desc = "which_key_ignore" },
      },
    },
  },
}
