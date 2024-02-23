return {
	-- Required fields
	name = "py-lint",
	builder = function(params)
		-- This must return an overseer.TaskDefinition
		return {
			-- cmd is the only required field
			cmd = { "./orch" },
			-- additional arguments for the cmd
			args = { "py-lint" },
			-- the name of the task (defaults to the cmd of the task)
			name = "py-lint",
			-- set the working directory for the task
			cwd = vim.fn.getcwd(),
			-- additional environment variables
			env = {},
			-- the list of components or component aliases to add to the task
			components = { { "restart_on_save", delay = 50 }, "default" },
		}
	end,
}
