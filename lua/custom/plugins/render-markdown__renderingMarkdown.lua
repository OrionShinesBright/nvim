require('render-markdown').setup({
    -- Whether markdown should be rendered by default.
    enabled = true,
    render_modes = { 'n', 'c', 't', 'v'},
    max_file_size = 10.0, -- in MB
    debounce = 100,
    -- | obsidian | mimic Obsidian UI                                          |
    -- | lazy     | will attempt to stay up to date with LazyVim configuration |
    -- | none     | does nothing                                               |
    preset = 'lazy',
    file_types = { 'markdown', 'typst' },
    nested = true,
    change_events = {},
    patterns = {
        markdown = {
            disable = false,
            directives = {
                { id = 17, name = 'conceal_lines' },
                { id = 18, name = 'conceal_lines' },
            },
        },
    },
    anti_conceal = {
        enabled = true,
        disabled_modes = false,
        above = 0,
        below = 0,
        --   bullet
        --   callout
        --   check_icon, check_scope
        --   code_background, code_border, code_language
        --   dash
        --   head_background, head_border, head_icon
        --   indent
        --   link
        --   quote
        --   sign
        --   table_border
        --   virtual_lines
        ignore = {
            code_background = true,
            code_border = false,
            code_language = true,
            indent = true,
            bullet = true,
            table_border = true,
            sign = true,
            virtual_lines = true,
        },
    },
    padding = {
        highlight = 'Normal',
    },
    latex = {
        enabled = true,
        render_modes = false,
        -- Executable used to convert latex formula to rendered unicode.
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        -- Determines where latex formula is rendered relative to block.
        -- | above | above latex block |
        -- | below | below latex block |
        position = 'above',
        top_pad = 0,
        bottom_pad = 0,
        virtual = false,
    },
    completions = {
        lsp = { enabled = true },
    },
    heading = {
        enabled = true,
        render_modes = false,
        -- Turn on / off sign column related rendering.
        sign = true,
        icons = { '󰲡 ', '󰲣 ', '󰲥 ', '󰲧 ', '󰲩 ', '󰲫 ' },
        -- | right   | '#'s are concealed and icon is appended to right side                      |
        -- | inline  | '#'s are concealed and icon is inlined on left side                        |
        -- | overlay | icon is left padded with spaces and inserted on left hiding additional '#' |
        position = 'right',
        signs = { '󰫎 ' },
        -- | block | width of the heading text |
        -- | full  | full width of the window  |
        width = 'full',
        left_margin = 1,
        border = false,
        border_virtual = true,
    },
    paragraph = {
        enabled = true,
        render_modes = false,
        left_margin = 0,
        -- Amount of padding to add to the first line of each paragraph.
        indent = 4,
        min_width = 0,
    },
    code = {
        enabled = true,
        render_modes = false,
        sign = true,
        conceal_delimiters = false,
        language = false,
        -- | right | right side of code block |
        -- | left  | left side of code block  |
        position = 'right',
        language_icon = true,
        language_name = true,
        language_info = true,
        disable_background = true,
        -- | block | width of the code block  |
        -- | full  | full width of the window |
        width = 'full',
        -- | none  | do not render a border                               |
        -- | thick | use the same highlight as the code body              |
        -- | thin  | when lines are empty overlay the above & below icons |
        -- | hide  | conceal lines unless language name or icon is added  |
        border = 'none',
        -- | none     | { enabled = false }                           |
        -- | normal   | { language = false }                          |
        -- | language | { disable_background = true, inline = false } |
        -- | full     | uses all default values                       |
        style = 'full',
    },
    dash = {
        enabled = true,
        render_modes = false,
        icon = '─',
    },
    document = {
        enabled = true,
        render_modes = false,
    },
    bullet = {
        -- | level | how deeply nested the list is, 1-indexed          |
        -- | index | how far down the item is at that level, 1-indexed |
        -- | value | text value of the marker node                     |
        enabled = true,
        render_modes = false,
        -- | function   | `value(context)`                                    |
        -- | string     | `value`                                             |
        -- | string[]   | `cycle(value, context.level)`                       |
        -- | string[][] | `clamp(cycle(value, context.level), context.index)` |
        icons = { '●', '○', '◆', '◇' },
    },
    checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        unchecked = {
            icon = '󰄱 ',
        },
        checked = {
            icon = '󰱒 ',
        },
        custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        },
    },
    quote = {
        enabled = true,
        render_modes = false,
    },
    pipe_table = {
        enabled = true,
        render_modes = false,
        -- | heavy  | use thicker border characters     |
        -- | double | use double line border characters |
        -- | round  | use round border corners          |
        -- | none   | does nothing                      |
        preset = 'heavy',
        -- Determines how individual cells of a table are rendered.
        -- | overlay | writes completely over the table, removing conceal behavior and highlights |
        -- | raw     | replaces only the '|' characters in each row, leaving the cells unmodified |
        -- | padded  | raw + cells are padded to maximum visual width for each column             |
        -- | trimmed | padded except empty space is subtracted from visual width calculation      |
        cell = 'padded',
        cell_offset = function()
            return 0
        end,
        border = {
            '┌', '┬', '┐',
            '├', '┼', '┤',
            '└', '┴', '┘',
            '│', '─',
        },
        border_enabled = true,
        border_virtual = false,
        alignment_indicator = '━',
        -- Determines how the table as a whole is rendered.
        -- | none   | { enabled = false }        |
        -- | normal | { border_enabled = false } |
        -- | full   | uses all default values    |
        style = 'full',
    },
    callout = {
        note      = { raw = '[!NOTE]',      rendered = '󰋽 Note',      highlight = 'RenderMarkdownInfo',    category = 'github'   },
        tip       = { raw = '[!TIP]',       rendered = '󰌶 Tip',       highlight = 'RenderMarkdownSuccess', category = 'github'   },
        important = { raw = '[!IMPORTANT]', rendered = '󰅾 Important', highlight = 'RenderMarkdownHint',    category = 'github'   },
        warning   = { raw = '[!WARNING]',   rendered = '󰀪 Warning',   highlight = 'RenderMarkdownWarn',    category = 'github'   },
        caution   = { raw = '[!CAUTION]',   rendered = '󰳦 Caution',   highlight = 'RenderMarkdownError',   category = 'github'   },
        abstract  = { raw = '[!ABSTRACT]',  rendered = '󰨸 Abstract',  highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        summary   = { raw = '[!SUMMARY]',   rendered = '󰨸 Summary',   highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        tldr      = { raw = '[!TLDR]',      rendered = '󰨸 Tldr',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        info      = { raw = '[!INFO]',      rendered = '󰋽 Info',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        todo      = { raw = '[!TODO]',      rendered = '󰗡 Todo',      highlight = 'RenderMarkdownInfo',    category = 'obsidian' },
        hint      = { raw = '[!HINT]',      rendered = '󰌶 Hint',      highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        success   = { raw = '[!SUCCESS]',   rendered = '󰄬 Success',   highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        check     = { raw = '[!CHECK]',     rendered = '󰄬 Check',     highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        done      = { raw = '[!DONE]',      rendered = '󰄬 Done',      highlight = 'RenderMarkdownSuccess', category = 'obsidian' },
        question  = { raw = '[!QUESTION]',  rendered = '󰘥 Question',  highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        help      = { raw = '[!HELP]',      rendered = '󰘥 Help',      highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        faq       = { raw = '[!FAQ]',       rendered = '󰘥 Faq',       highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        attention = { raw = '[!ATTENTION]', rendered = '󰀪 Attention', highlight = 'RenderMarkdownWarn',    category = 'obsidian' },
        failure   = { raw = '[!FAILURE]',   rendered = '󰅖 Failure',   highlight = 'RenderMarkdownError',   category = 'obsidian' },
        fail      = { raw = '[!FAIL]',      rendered = '󰅖 Fail',      highlight = 'RenderMarkdownError',   category = 'obsidian' },
        missing   = { raw = '[!MISSING]',   rendered = '󰅖 Missing',   highlight = 'RenderMarkdownError',   category = 'obsidian' },
        danger    = { raw = '[!DANGER]',    rendered = '󱐌 Danger',    highlight = 'RenderMarkdownError',   category = 'obsidian' },
        error     = { raw = '[!ERROR]',     rendered = '󱐌 Error',     highlight = 'RenderMarkdownError',   category = 'obsidian' },
        bug       = { raw = '[!BUG]',       rendered = '󰨰 Bug',       highlight = 'RenderMarkdownError',   category = 'obsidian' },
        example   = { raw = '[!EXAMPLE]',   rendered = '󰉹 Example',   highlight = 'RenderMarkdownHint' ,   category = 'obsidian' },
        quote     = { raw = '[!QUOTE]',     rendered = '󱆨 Quote',     highlight = 'RenderMarkdownQuote',   category = 'obsidian' },
        cite      = { raw = '[!CITE]',      rendered = '󱆨 Cite',      highlight = 'RenderMarkdownQuote',   category = 'obsidian' },
    },
    link = {
        enabled = true,
        render_modes = false,
        footnote = {
            enabled = true,
            superscript = true,
            prefix = '',
            suffix = '',
        },
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = {
            icon = '󱗖 ',
            body = function()
                return nil
            end,
            highlight = 'RenderMarkdownWikiLink',
            scope_highlight = nil,
        },
        custom = {
            web = { pattern = '^http', icon = '󰖟 ' },
            discord = { pattern = 'discord%.com', icon = '󰙯 ' },
            github = { pattern = 'github%.com', icon = '󰊤 ' },
            gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
            google = { pattern = 'google%.com', icon = '󰊭 ' },
            neovim = { pattern = 'neovim%.io', icon = ' ' },
            reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
            stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
            wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
            youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
        },
    },
    sign = {
        enabled = true,
        highlight = 'RenderMarkdownSign',
    },
    inline_highlight = {
        -- Mimics Obsidian inline highlights when content is surrounded by double equals.
        -- The equals on both ends are concealed and the inner content is highlighted.

        -- Turn on / off inline highlight rendering.
        enabled = true,
        -- Additional modes to render inline highlights.
        render_modes = false,
        -- Applies to background of surrounded text.
        highlight = 'RenderMarkdownInlineHighlight',
    },
    indent = {
        -- Mimic org-indent-mode behavior by indenting everything under a heading based on the
        -- level of the heading. Indenting starts from level 2 headings onward by default.

        -- Turn on / off org-indent-mode.
        enabled = false,
        -- Additional modes to render indents.
        render_modes = false,
        -- Amount of additional padding added for each heading level.
        per_level = 2,
        -- Heading levels <= this value will not be indented.
        -- Use 0 to begin indenting from the very first level.
        skip_level = 1,
        -- Do not indent heading titles, only the body.
        skip_heading = false,
        -- Prefix added when indenting, one per level.
        icon = '▎',
        -- Priority to assign to extmarks.
        priority = 0,
        -- Applied to icon.
        highlight = 'RenderMarkdownIndent',
    },
    html = {
        -- Turn on / off all HTML rendering.
        enabled = true,
        -- Additional modes to render HTML.
        render_modes = false,
        comment = {
            -- Turn on / off HTML comment concealing.
            conceal = true,
            -- Optional text to inline before the concealed comment.
            text = nil,
            -- Highlight for the inlined text.
            highlight = 'RenderMarkdownHtmlComment',
        },
        -- HTML tags whose start and end will be hidden and icon shown.
        -- The key is matched against the tag name, value type below.
        -- | icon      | gets inlined at the start |
        -- | highlight | highlight for the icon    |
        tag = {},
    },
    win_options = {
        -- Window options to use that change between rendered and raw view.

        -- @see :h 'conceallevel'
        conceallevel = {
            -- Used when not being rendered, get user setting.
            default = vim.o.conceallevel,
            -- Used when being rendered, concealed text is completely hidden.
            rendered = 2,
        },
        -- @see :h 'concealcursor'
        concealcursor = {
            -- Used when not being rendered, get user setting.
            default = vim.o.concealcursor,
            -- Used when being rendered, show concealed text in all modes.
            rendered = '',
        },
    },
    overrides = {
        -- More granular configuration mechanism, allows different aspects of buffers to have their own
        -- behavior. Values default to the top level configuration if no override is provided. Supports
        -- the following fields:
        --   enabled, render_modes, max_file_size, debounce, anti_conceal, bullet, callout, checkbox,
        --   code, dash, document, heading, html, indent, inline_highlight, latex, link, padding,
        --   paragraph, pipe_table, quote, sign, win_options, yaml

        -- Override for different buflisted values, @see :h 'buflisted'.
        buflisted = {},
        -- Override for different buftype values, @see :h 'buftype'.
        buftype = {
            nofile = {
                render_modes = true,
                padding = { highlight = 'NormalFloat' },
                sign = { enabled = false },
            },
        },
        -- Override for different filetype values, @see :h 'filetype'.
        filetype = {},
    },
    custom_handlers = {
        -- Mapping from treesitter language to user defined handlers.
        -- @see [Custom Handlers](doc/custom-handlers.md)
    },
    yaml = {
        -- Turn on / off all yaml rendering.
        enabled = true,
        -- Additional modes to render yaml.
        render_modes = false,
    },
})
