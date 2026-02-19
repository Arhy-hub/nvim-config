-- neovim mappings, got chatgpt to generate to save time. In the future , further customise


local map = vim.keymap.set
local opts = { silent = true, noremap = true }

-----------------------------------------------------------
-- CORE / ALWAYS-ON
-----------------------------------------------------------
map("n", "<leader>w", "<cmd>w<cr>", opts)          -- save
map("n", "<leader>q", "<cmd>q<cr>", opts)          -- quit
map("n", "<leader>/", "<cmd>nohlsearch<cr>", opts) -- clear search
map("n", "<Esc>", "<cmd>noh<cr>", opts)

-----------------------------------------------------------
-- WINDOW / SPLITS
-----------------------------------------------------------
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>sv", "<cmd>vsplit<cr>", opts)
map("n", "<leader>sh", "<cmd>split<cr>", opts)

-----------------------------------------------------------
-- EDITING QUALITY OF LIFE
-----------------------------------------------------------
map("n", "j", "gj", opts)
map("n", "k", "gk", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-----------------------------------------------------------
-- TELESCOPE
-----------------------------------------------------------
map("n", "<leader>ff", function()
  require("telescope.builtin").find_files({cwd = vim.fn.getcwd(),})
end, opts)

map("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end, opts)

map("n", "<leader>fb", function()
  require("telescope.builtin").buffers()
end, opts)

-----------------------------------------------------------
-- FILE TREE
-----------------------------------------------------------
map("n", "<leader>e", function()
  require("nvim-tree.api").tree.toggle()
end, opts)

-----------------------------------------------------------
-- LSP (global – fine if you’re OK with them everywhere)
-----------------------------------------------------------
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K",  vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
map("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

-----------------------------------------------------------
-- GIT (gitsigns)
-----------------------------------------------------------
map("n", "]h", function()
  require("gitsigns").next_hunk()
end, opts)

map("n", "[h", function()
  require("gitsigns").prev_hunk()
end, opts)

-----------------------------------------------------------
-- TERMINAL (built-in)
-----------------------------------------------------------

local term_buf = nil

vim.keymap.set("n", "<leader>t", function()
  if term_buf and vim.api.nvim_buf_is_valid(term_buf) then
    -- close terminal window if visible
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.api.nvim_win_get_buf(win) == term_buf then
        vim.api.nvim_win_close(win, true)
        return
      end
    end
  end

  -- open terminal
  vim.cmd("split")
  vim.cmd("resize 15")
  vim.cmd("terminal")
  term_buf = vim.api.nvim_get_current_buf()
  vim.cmd("startinsert")
end, { silent = true, noremap = true })

-- exit terminal mode easily
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })



--------------------------------------------------------------
-- BUFFERLINE
--------------------------------------------------------------

vim.keymap.set("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { silent = true })
vim.keymap.set("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true })
vim.keymap.set("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { silent = true })
for i = 1, 9 do
  vim.keymap.set(
    "n",
    "<leader>" .. i,
    "<cmd>BufferLineGoToBuffer " .. i .. "<CR>",
    { silent = true }
  )
end

--------------------------------------------------------------
--AUTOCOMPLETE
--------------------------------------------------------------
