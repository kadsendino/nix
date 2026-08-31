return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    -- Lua LS korrekt konfigurieren
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Harper LS konfigurieren (optional, shown with defaults)
    vim.lsp.config("harper_ls", {
      filetypes = { "latex", "tex", "plaintex" },
      settings = {
        ["harper-ls"] = {
          linters = {
            SpellCheck = true,
            SpellNumbers = false,
            AnA = true,
            SentenceCapitalization = true,
            UnclosedQuotes = true,
            WrongQuotes = true,
            LongSentences = true,
            RepeatedWords = true,
            Spaces = false,
          },
          codeActions = {
            ForceStable = false,
          },
          maxFileLength = 240000,
        },
      },
    })

    -- LSPs aktivieren
    vim.lsp.enable("pyright")
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("texlab")
    vim.lsp.enable("rust-analyzer")
    vim.lsp.enable("markdown")
    vim.lsp.enable("harper_ls")
  end,
}
