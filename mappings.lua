-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { ":tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = { function() require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end) end, desc = "Pick to close" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- move buffer
    ["<S-l>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
    ["<S-h>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

    -- move lines
    ["<A-j>"] = { ":m .+1<cr>==", desc = "Move down" },
    ["<A-k>"] = { ":m .-2<cr>==", desc = "Move up" },

    -- Smart Splits
    ["<A-Up>"] = { function() require("smart-splits").resize_up() end, desc = "Resize split up" },
    ["<A-Down>"] = { function() require("smart-splits").resize_down() end, desc = "Resize split down" },
    ["<A-Left>"] = { function() require("smart-splits").resize_left() end, desc = "Resize split left" },
    ["<A-Right>"] = { function() require("smart-splits").resize_right() end, desc = "Resize split right" },
  },
  i = {
    -- move lines
    ["<A-j>"] = { "<esc>:m .+1<cr>==gi", desc = "Move down" },
    ["<A-k>"] = { "<esc>:m .-2<cr>==gi", desc = "Move up" },
  },
  v = {
    -- move lines
    ["<A-j>"] = { ":m '>+1<cr>gv=gv", desc = "Move down" },
    ["<A-k>"] = { ":m '<-2<cr>gv=gv", desc = "Move up" }, 

    -- diff with clipboard
    ["<leader>!"] = { 
      function()  
	      local ftype = vim.api.nvim_eval("&filetype")
	      vim.cmd("vsplit")
	      vim.cmd("enew")
	      vim.cmd("normal! P")
	      vim.cmd("setlocal buftype=nowrite")
	      vim.cmd("set filetype="..ftype)
	      vim.cmd("diffthis")
	      vim.cmd([[execute "normal! \<C-w>h"]])

        vim.cmd("normal! gv")
        vim.cmd("'<,'>y")
	      vim.cmd("vsplit")
	      vim.cmd("enew")
	      vim.cmd("normal! P")
	      vim.cmd("setlocal buftype=nowrite")
	      vim.cmd("set filetype="..ftype)
	      vim.cmd("diffthis")
      end, 
      desc = "diff with clipboard"
    }
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
