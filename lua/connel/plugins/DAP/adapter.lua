local dap_status, dap = pcall(require, "dap")
if not dap_status then
	return
end

dap.adapters.python = function(cb, config)
	if config.request == "attach" then
		---@diagnostic disable-next-line: undefined-field
		local port = (config.connect or config).port
		---@diagnostic disable-next-line: undefined-field
		local host = (config.connect or config).host or "127.0.0.1"
		cb({
			type = "server",
			port = assert(port, "`connect.port` is required for a python `attach` configuration"),
			host = host,
			options = {
				source_filetype = "python",
			},
		})
	else
		cb({
			type = "executable",
			command = "python3",
			args = {
				"-m",
				"debugpy.adapter",
			},
			options = {
				source_filetype = "python",
			},
		})
	end
end

dap.adapters.codelldb = {
	type = "server",
	host = "127.0.0.1",
	port = "${port}",
	executable = {
		command = "/Users/gunneo/.local/share/nvim/mason/bin/codelldb", -- 确保此路径正确指向 codelldb 可执行文件
		args = { "--port", "${port}" },
		env = {
			LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES",
		},
	},
}
