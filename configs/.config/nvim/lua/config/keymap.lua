-- Bufferline
vim.keymap.set("n", "<Tab>",   "<cmd>BufferLineCycleNext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev tab" })
vim.keymap.set("n", "<leader>x",  "<cmd>bdelete<cr>",          { desc = "Close tab" })
vim.keymap.set("n", "<leader>1",  "<cmd>BufferLineGoToBuffer 1<cr>")
vim.keymap.set("n", "<leader>2",  "<cmd>BufferLineGoToBuffer 2<cr>")
vim.keymap.set("n", "<leader>3",  "<cmd>BufferLineGoToBuffer 3<cr>")

-- Telescope
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
vim.keymap.set("n", "<leader>fp", builtin.planets, { desc = "Planets" })
