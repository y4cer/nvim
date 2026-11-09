vim.pack.add {
  { src = "https://github.com/romus204/tree-sitter-manager.nvim" }
}

-- SageMath source is Python-like; reuse the Python grammar for .sage files.
vim.treesitter.language.register('python', 'sage')

require("tree-sitter-manager").setup {
  ensure_installed = { "terraform", "python" },
}

-- vim: ts=2 sts=2 sw=2 et
