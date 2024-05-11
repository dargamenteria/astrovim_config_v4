return {
  "hrsh7th/cmp-cmdline",
  keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = function()
    local cmp = require "cmp"
    return {
      {
        type = "?",
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline_history" },
          { name = "buffer" },
        },
      },
      {
        type = "/",
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "cmdline_history" },
          { name = "buffer" },
        },
      },
      {
        type = ":",
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources {
          { name = "cmdline_history" },
          { name = "path" },
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man" },
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
  end,
}
