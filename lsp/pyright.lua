-- python lsp config
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
		},
	},
}
