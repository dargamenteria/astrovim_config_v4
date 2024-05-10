vim.g.material_style = "deep ocean"

--dap up per project
require("nvim-dap-projects").search_project_config()

--vim.keymap.set("n", "<leader>ux", vim.cmd.UndotreeToggle, { desc = "UndotreeToggle" })
--vim.api.nvim_set_keymap("n", "<leader>uC", "<cmd>lua require('fine-cmdline').open({default_value = ''})<CR>", { noremap = true })

----------
--Terminal stuff
----------
--vim.keymap.set("n", "<F3>", "<cmd>ToggleTerm direction=horizontal size=20<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", ":silent Telescope cmdline<CR>", { noremap = true, desc = "Cmdline" })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "º", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal

local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
function _G._lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tg",
  "<cmd>lua _lazygit_toggle()<CR>",
  { noremap = true, silent = true, desc = "lazygit" }
)

local k9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })
function _G._k9s_toggle()
  k9s:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tk",
  "<cmd>lua _k9s_toggle()<CR>",
  { noremap = true, silent = true, desc = "k9s" }
)

local tftui = Terminal:new({ cmd = "tftui", hidden = true, direction = "float" })
function _G._tftui_toggle()
  tftui:toggle()
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>tt",
  "<cmd>lua _tftui_toggle()<CR>",
  { noremap = true, silent = true, desc = "tftui" }
)

----------
--END OF Terminal stuff
----------

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
local telescope = require("telescope")
telescope.setup({
  extensions = {
    cmdline = {
      output_pane = {
        enabled = true,
      },
    },
  },
})

telescope.load_extension("cmdline")
