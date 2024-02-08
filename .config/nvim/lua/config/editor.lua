local set = vim.opt

set.number = true
set.relativenumber = true

set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4
set.expandtab = true

set.smartindent = true

set.wrap = false

set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"

-- init.lua

-- Function to generate the custom tabline
function custom_tabline()
    local tabline = ''
    local current_tab = vim.fn.tabpagenr()

    for i = 1, vim.fn.tabpagenr('$') do
        local tab_number = i
        local tab_label = vim.fn.fnamemodify(vim.fn.bufname(vim.fn.tabpagebuflist(i)[1]), ":t")

        -- Highlight the current tab
        local tab_highlight = (i == current_tab) and '%#TabLineSel#' or '%#TabLine#'

        tabline = tabline .. tab_highlight .. ' ' .. tab_number .. ': ' .. tab_label .. ' %T '
    end

    return tabline
end

-- Set the custom tabline
vim.o.tabline = '%!v:lua.custom_tabline()'

