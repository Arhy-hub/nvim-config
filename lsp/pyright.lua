-- python lsp config

local function get_python_path()
  local cwd = vim.fn.getcwd()
  local handle = vim.loop.fs_scandir(cwd)

  if not handle then
    return nil
  end

  while true do
    local name, type = vim.loop.fs_scandir_next(handle)
    if not name then break end

    if type == "directory" then
      local python_path = cwd .. "/" .. name .. "/bin/python"
      if vim.fn.executable(python_path) == 1 then
        return python_path
      end
    end
  end

  return nil
end


return {
	cmd = {
		"pyright-langserver",
		"--stdio",
	},
	root_markers = {
		'pyrightconfig.json',
		'pyproject.toml',
		'setup.py',
		'setup.cfg',
		'requirements.txt',
		'Pipfile',
		'.git',
	},
	filetypes = {
		"python",
	},
	settings = {
		analysis = {
			autoSearchPaths = true,
			useLibraryCodeForTypes = true,
			diagnosticMode = 'openFilesOnly',
			pythonPath = get_python_path()
		},
	},
}
