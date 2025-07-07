return {
	"ThePrimeagen/harpoon",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon_mark = require("harpoon.mark")
		local harpoon_ui = require("harpoon.ui")
		local harpoon_term = require("harpoon.term")

		require("harpoon").setup({
			menu = {
				width = vim.api.nvim_win_get_width(0) - 60,
			},
		})

		local keymap = vim.keymap.set
		local opts = { noremap = true, silent = true }

		-- Dosya ekle
		keymap("n", "<leader>a", harpoon_mark.add_file, opts)
		-- Menü aç
		keymap("n", "<leader>h", harpoon_ui.toggle_quick_menu, opts)

		-- Hızlı geçiş tuşları
		keymap("n", "<leader>1", function()
			harpoon_ui.nav_file(1)
		end, opts)
		keymap("n", "<leader>2", function()
			harpoon_ui.nav_file(2)
		end, opts)
		keymap("n", "<leader>3", function()
			harpoon_ui.nav_file(3)
		end, opts)
		keymap("n", "<leader>4", function()
			harpoon_ui.nav_file(4)
		end, opts)
		keymap("n", "<leader>ta", function()
			harpoon_term.gotoTerminal(1) -- navigates to term 1
		end, opts)

		-- Harpoon listesi içinde ileri / geri
		keymap("n", "<leader>j", harpoon_ui.nav_next, opts) -- sonraki
		keymap("n", "<leader>k", harpoon_ui.nav_prev, opts) -- önceki
	end,
}
