return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      java = { "google-java-format" },
      json = { "prettier" },
      javascript = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
      go = { "goimports" },
    },
  },
}
