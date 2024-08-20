local set = vim.opt

-- setup for list characters
vim.cmd([[
  augroup ListCharsSettings
    autocmd FileType java,bash,go,latex,c,markdown,make,lua setlocal list listchars+=eol:\\u21B2,trail:.
  augroup END
  augroup NvimTermSettings
      autocmd TermOpen * setlocal nonumber norelativenumber
  augroup END
]])

--blockcursor
set.guicursor=""

--line numbering
set.number = true
set.relativenumber = true

-- tabs and indenting
set.expandtab = true
set.shiftwidth = 4
set.softtabstop = 4
set.tabstop = 4
set.smartindent = true

set.wrap = false

--swap and undo options
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true


--search behavior
set.hlsearch = false
set.incsearch = true

set.termguicolors = true

set.scrolloff = 8
set.signcolumn = "yes"

set.path:append '**'

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
