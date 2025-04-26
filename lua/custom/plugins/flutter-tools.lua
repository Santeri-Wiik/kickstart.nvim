local isFlutter = #vim.fs.find('pubspec.yaml', { upward = true }) > 0
return {
  'nvim-flutter/flutter-tools.nvim',
  cond = isFlutter,
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = true,
}
