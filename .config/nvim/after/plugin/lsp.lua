local lsp_zero = require('lsp-zero').preset({})
local lsp_config = require('lspconfig')

lsp_zero.on_attach(function(_, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

lsp_zero.set_server_config({
    on_init = function(client)
        client.server_capabilities.semanticTokensProvider = nil
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end
})

lsp_config["dartls"].setup({
    cmd = { "dart", "language-server", "--protocol=lsp" },
    settings = {
        dart = {
            analysisExcludedFolders = {
                vim.fn.expand("$HOME/.pub-cache"),
                vim.fn.expand("$HOME/flutter"),
            }
        }
    }
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        --setup the language servers
        lsp_config.clangd.setup({}),
        lsp_config.lua_ls.setup({}),
        lsp_config.ts_ls.setup({}),
        lsp_config.bashls.setup({}),
        lsp_config.html.setup({}),
    },
})

for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

--disable semantic highlighting
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

lsp_zero.setup({})
