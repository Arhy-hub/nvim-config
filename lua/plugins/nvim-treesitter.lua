-- treesitter for better syntax highlighting
return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate'
}
