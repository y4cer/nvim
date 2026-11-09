-- LaTeX compilation and PDF navigation; texlab supplies LSP completion.
vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_view_automatic = 0
vim.g.vimtex_compiler_latexmk = {
  continuous = 1,
  out_dir = 'build',
}

vim.pack.add { 'https://github.com/lervag/vimtex' }

vim.api.nvim_create_autocmd('User', {
  group = vim.api.nvim_create_augroup('latex-autobuild', { clear = true }),
  pattern = 'VimtexEventInitPost',
  command = 'VimtexCompile!',
})

-- vim: ts=2 sts=2 sw=2 et
