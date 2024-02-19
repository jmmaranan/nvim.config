local M = {}

-- In this case, we create a function that lets us more easily define mappings specific
-- for LSP related items. It sets the mode, buffer and description for us each time.
local nmap = function(keys, func, desc, bufnr)
  if desc then
    desc = "LSP: " .. desc
  end

  vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
end

--  This function gets run when an LSP connects to a particular buffer.
M.on_attach = function(_, bufnr)
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame", bufnr)

  -- Code actions on normal and visual modes
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", bufnr)
  vim.keymap.set(
    "v",
    "<space>ca",
    "<ESC><CMD>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, buffer = bufnr, desc = "Code actions" }
  )

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition", bufnr)
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences", bufnr)
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation", bufnr)
  nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition", bufnr)
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols", bufnr)
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols", bufnr)

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation", bufnr)
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation", bufnr)

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration", bufnr)
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder", bufnr)
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder", bufnr)
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders", bufnr)

  -- Create a command `:Format` local to the LSP buffer
  nmap("<space>fc", function()
    vim.lsp.buf.format({ async = true })
  end, "[F]ormat [C]urrent Buffer", bufnr)
  vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "Format current buffer with LSP" })
end

M.nmap = nmap

return M
