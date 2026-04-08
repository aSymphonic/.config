return {
    {
        'saghen/blink.cmp',
        dependencies = 'rafamadriz/friendly-snippets',
        version = '*', -- Use a release tag to ensure stability

        opts = {

            cmdline = {
                enabled = true,
                keymap = { preset = 'cmdline' }, -- Enter to confirm, arrows/tab to select
                sources = function()
                    local type = vim.fn.getcmdtype()
                    if type == '/' or type == '?' then return { 'buffer' } end
                    if type == ':' then return { 'cmdline' } end
                    return {}
                end
            },

            -- 'default' for mapping similar to vscode
            -- 'super-tab' for mapping similar to readline (tab to cycle)
            keymap = {
                preset = 'default',
                ['<CR>'] = { 'accept', 'fallback' }, -- Accept the selection, or New Line if menu is closed
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
            },

            appearance = {
                use_nvim_cmp_as_default = true,
                nerd_font_variant = 'mono'
            },

            -- Default list of enabled providers
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },

            -- This makes the completion window look like your other floating boxes

            completion = {
                -- 2. "List" settings: This is the secret sauce
                list = { 
                    selection = { 
                        preselect = true,           -- Automatically highlight the first item
                        auto_insert = false          -- Don't insert text until you actually hit Enter
                    } 
                }
            },

                -- Signature help (the little box showing function arguments)
                signature = { enabled = true, window = { border = 'rounded' } }
            },
            opts_extend = { "sources.default" }
        },
    }
