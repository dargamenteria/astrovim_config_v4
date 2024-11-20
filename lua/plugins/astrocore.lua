---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
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
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {
        ["<C-CR>"] = { "cmd lua require('in-and-out').in_and_out()<br>", desc = "in-and-out trigger" },
      },
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        H = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        ["<leader>B"] = { "<cmd>Neotree buffers<cr>", desc = "Neotree Buffers" },
        ["<leader>G"] = { "<cmd>Neotree git_status<cr>", desc = "Neotree Git Status" },
        ["<leader>ux"] = { "<cmd>UndotreeToggle<cr>", desc = "UndotreeToggle" },
        ["<leader>fx"] = {
          "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
          desc = "live_ggrep_args",
        },

        ["<C-h>"] = { "<cmd>lua require('smart-splits').move_cursor_left()<cr>", desc = "move cursor left" },
        ["<C-l>"] = { "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "move cursor right" },
        ["<C-k>"] = { "<cmd>lua require('smart-splits').move_cursor_up()<cr>", desc = "move cursor up" },
        ["<C-j>"] = { "<cmd>lua require('smart-splits').move_cursor_down()<cr>", desc = "move cursor down" },

        ["<A-h>"] = { "<cmd>lua require('smart-splits').resize_left(3)<cr>", desc = "resize left" },
        ["<A-l>"] = { "<cmd>lua require('smart-splits').resize_right(3)<cr>", desc = "resize right" },
        ["<A-k>"] = { "<cmd>lua require('smart-splits').resize_up(3)<cr>", desc = "resize up" },
        ["<A-j>"] = { "<cmd>lua require('smart-splits').resize_down(3)<cr>", desc = "resize down" },

        ["<leader><leader>h"] = { "<cmd>lua require('smart-splits').swap_buf_left()<cr>", desc = "swap buffer left" },
        ["<leader><leader>l"] = { "<cmd>lua require('smart-splits').swap_buf_right()<cr>", desc = "swap buffer right" },
        ["<leader><leader>k"] = { "<cmd>lua require('smart-splits').swap_buf_up<cr>", desc = "swap buffer up" },
        ["<leader><leader>j"] = { "<cmd>lua require('smart-splits').swap_buf_down()<cr>", desc = "swap buffer down" },

        ["<C-CR>"] = { "cmd lua require('in-and-out').in_and_out()<br>", desc = "in-and-out trigger" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
      },
      t = {
        -- setting a mapping to false will disable it
        -- ["<esc>"] = false,
      },
    },
  },
}
