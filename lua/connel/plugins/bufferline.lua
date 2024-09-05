local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		indicator = {
			icon = "▎",
			style = "icon",
		},
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		name_formatter = function(buf)
			-- Implement logic here if needed
			return buf.name
		end,
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_on_event = true,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		custom_filter = function(buf_number, buf_numbers)
			-- Implement custom filter logic here
			return true
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		duplicates_across_groups = true,
		persist_buffer_sort = true,
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = "insert_after_current",
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
	},
})
