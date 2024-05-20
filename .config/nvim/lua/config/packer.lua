vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ThePrimeagen/vim-be-good'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use 'lervag/vimtex'
    use 'ThePrimeagen/harpoon'
    use 'mbbill/undotree'
    --use 'tpope/vim-fugitive'
    use 'shaunsingh/nord.nvim'
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Required
            { 'hrsh7th/cmp-path' }, -- Required
            { 'hrsh7th/cmp-cmdline' }, -- Required
            { 'L3MON4D3/LuaSnip' }, -- Required
        }
    }
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
    use 'mfussenegger/nvim-jdtls'
    use 'ggandor/leap.nvim'
    use 'm4xshen/autoclose.nvim'
end)
