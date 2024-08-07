local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>gi', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ")})
end)

require("telescope").setup {
  pickers = {
    buffers = {
      show_all_buffers = true,
      sort_lastused = true,
      mappings = {
        i = {
          ["<C-a>"] = "delete_buffer",
        }
      }
    }
  }
}
