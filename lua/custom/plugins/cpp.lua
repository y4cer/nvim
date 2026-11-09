-- Use the system clangd, independently of Mason-managed language servers.
vim.lsp.config('clangd', {
  cmd = { '/usr/bin/clangd', '--background-index', '--clang-tidy' },
  -- CMake projects may have neither a Git repository nor a database at the root.
  -- clangd also discovers compile_commands.json in the project's build/ directory.
  root_markers = {
    '.clangd',
    'compile_commands.json',
    'compile_flags.txt',
    'CMakeLists.txt',
    '.clang-tidy',
    '.clang-format',
    'configure.ac',
    '.git',
  },
})
vim.lsp.enable('clangd')
