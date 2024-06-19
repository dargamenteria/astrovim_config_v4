-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  "AstroNvim/astrocommunity",
  --languages
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.terraform" },
  { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },

  { import = "astrocommunity.lsp.actions-preview-nvim" },
  { import = "astrocommunity.diagnostics/trouble-nvim" },

  { import = "astrocommunity.search.nvim-hlslens" },

  --other
  -- { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },

  { import = "astrocommunity.workflow.hardtime-nvim" },
  { import = "astrocommunity.project.projectmgr-nvim" },

  --debug
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.debugging.nvim-dap-repl-highlights" },

  -- import/override with your plugins folder
}
