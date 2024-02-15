local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>pp", ui.toggle_quick_menu, { desc = 'Toggle the Harpoon UI' })
vim.keymap.set("n", "<leader>pa", mark.add_file, { desc = 'Append Current Buffer to Harpoon' })

vim.keymap.set("n", "<leader>pq", function() ui.nav_file(1) end, { desc = 'Navigate to Harpoon File 1' })
vim.keymap.set("n", "<leader>pw", function() ui.nav_file(2) end, { desc = 'Navigate to Harpoon File 2' })
vim.keymap.set("n", "<leader>pe", function() ui.nav_file(3) end, { desc = 'Navigate to Harpoon File 3' })
vim.keymap.set("n", "<leader>pr", function() ui.nav_file(4) end, { desc = 'Navigate to Harpoon File 4' })
