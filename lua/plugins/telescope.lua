-- fuzzy finder
return {
    'nvim-telescope/telescope.nvim',
    opts={
	    defaults = {
		    hidden = true,
		    follow = true,
	    },
	    pickers = {
		    find_files = {
			    hidden = true,
			    follow = true,
			    no_ignore = true,
			    no_ignore_parent = true,
		    },
	    },
    },
    version = '*',
    dependencies = {
	    'nvim-lua/plenary.nvim',
	    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	}
}
