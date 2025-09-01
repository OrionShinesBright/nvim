require("mini.completion").setup({
  delay = { completion = 50, info = 50, signature = 25 },
  window = {
    info = { height = 25, width = 80, border = 'single' },
    signature = { height = 25, width = 80, border = 'single' },
  },
  lsp_completion = {
    source_func = 'completefunc', -- or omnifunc
    auto_setup = true,
    snippet_insert = nil,
  },
  fallback_action = '<C-n>',
  mappings = {
    force_twostep = '<C-Space>',
    force_fallback = '<A-Space>',
    scroll_down = '<C-f>',
    scroll_up = '<C-b>',
  },
})
