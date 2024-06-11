-- custom leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- open terminal panes from nvim
vim.keymap.set("n", "<leader>t<CR>", function()
    local current_directory = vim.api.nvim_call_function('getcwd', {})
    os.execute(string.format('tmux new-window -c %s', current_directory))
end)
vim.keymap.set("n", "<leader>h<CR>", function()
    local current_directory = vim.api.nvim_call_function('getcwd', {})
    os.execute(string.format('tmux split-window -h -c %s', current_directory))
end)
vim.keymap.set("n", "<leader>v<CR>", function()
    local current_directory = vim.api.nvim_call_function('getcwd', {})
    os.execute(string.format('tmux split-window -v -c %s', current_directory))
end)

-- move selected line
vim.keymap.set("v", "K", ":m '<-2<CR>gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv")

-- always center the view on jumps
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")


-- yank into system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- redirect deleted text into black hole register
vim.keymap.set("x", "<leader>p", "\"_dp")
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("i", "<C-c>", "<Esc>")

-- substitue snippet
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- chmod from nvim
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- tab navigation
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", vim.cmd.tablast)
vim.keymap.set("n", "Q", vim.cmd.tabclose)
vim.keymap.set("n", "H", "gT")
vim.keymap.set("n", "L", "gt")
vim.keymap.set("n", "<leader>tn", function ()
    vim.cmd('tabnew ' .. vim.fn.expand('%:p:h'))
end)
