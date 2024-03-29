return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      yamlls = {
        settings = {
          -- To support AWS Cloudformation
          yaml = {
            customTags = {
              "!Base64",
              "!Cidr",
              "!FindInMap sequence",
              "!GetAtt",
              "!GetAZs",
              "!ImportValue",
              "!Join sequence",
              "!Ref",
              "!Select sequence",
              "!Split sequence",
              "!Sub sequence",
              "!Sub",
              "!And sequence",
              "!Condition",
              "!Equals sequence",
              "!If sequence",
              "!Not sequence",
              "!Or sequence",
            },
          },
        },
      },
    },
  },
}
