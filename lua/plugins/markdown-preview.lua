return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "[M]arkdown[P]review" },
    { "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "[M]arkdownPreview[S]top" },
    { "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "[M]arkdownPreview[T]oggle" },
  },
}
