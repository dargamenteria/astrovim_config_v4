return {
  {
    "ysmb-wtsg/in-and-out.nvim",
    config = function()
      vim.keymap.set("i", "<C-CR>", function() require("in-and-out").in_and_out() end)
    end,
  },
  { "ysmb-wtsg/in-and-out.nvim" },
  { "marko-cerovac/material.nvim" },
  {
    "mbbill/undotree",
    event = "User AstroFile",
  },
  { "goolord/alpha-nvim", enabled = false },
  { "dmitmel/cmp-cmdline-history" },
}
