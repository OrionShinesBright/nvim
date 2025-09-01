require("mini.pick").setup({
  delay = {
    async = 10,
    busy = 10,
  },
  mappings = {
    toggle_info    = '<S-Tab>',
    toggle_preview = '<Tab>',
  },
  options = {
    content_from_bottom = false,
    use_cache = false,
  },
  window = {
    prompt_caret = '▏',
    prompt_prefix = 'Bro what do you want? ',
  },
})
