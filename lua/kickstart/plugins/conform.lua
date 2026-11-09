local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Formatting ]]
vim.pack.add { gh 'stevearc/conform.nvim' }
require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- You can specify filetypes to autoformat on save here:
    local enabled_filetypes = {
      haskell = true,
      c = true,
      cpp = true,
      tex = true,
      -- lua = true,
      -- python = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 2000, lsp_format = 'never' }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
  },
  formatters = {
    latexindent = {
      -- Avoid leaving indent.log in the current project.
      prepend_args = { "-g=/dev/null" },
    },
    ['stylish-haskell'] = {
      -- Find project config and Cabal extensions from the file's directory.
      cwd = function(_, ctx) return ctx.dirname end,
    },
    ['clang-format'] = {
      -- Keep project style settings while using four-space indentation.
      prepend_args = { '--style={BasedOnStyle: InheritParentConfig, IndentWidth: 4, TabWidth: 4, UseTab: Never}' },
    },
  },
  -- You can also specify external formatters in here.
  formatters_by_ft = {
    -- Format code with Ormolu, then align imports and pragmas with stylish-haskell.
    haskell = { 'ormolu', 'stylish-haskell' },
    c = { 'clang-format' },
    cpp = { 'clang-format' },
    tex = { 'latexindent' },
    -- rust = { 'rustfmt' },
    -- Conform can also run multiple formatters sequentially
    -- python = { "isort", "black" },
    --
    -- You can use 'stop_after_first' to run the first available formatter from the list
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })

-- vim: ts=2 sts=2 sw=2 et
