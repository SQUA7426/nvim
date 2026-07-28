return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )

    local signs = { Error = "⚔ ", Warn = "⚠ ", Hint = "⨁ ", Info = "ℹ " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local servers = {
      "html", "matlab_ls", "cssls", "sqls", "sqlls", "tailwindcss",
      "jsonls", "bashls", "pyright",
      "rust_analyzer", "cmake", "jdtls", "texlab"
    }

    for _, server in ipairs(servers) do
      vim.lsp.config(server, { capabilities = capabilities })
      vim.lsp.enable(server)
    end

    -- Emmet
    vim.lsp.config("emmet_ls", {
      capabilities = capabilities,
      filetypes = { "html", "css", "sass", "scss", "less" },
    })
    vim.lsp.enable("emmet_ls")

    -- Clangd
    vim.lsp.config("clangd", {
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--compile-commands-dir=builddir",
        "--background-index",
        "--clang-tidy",
      },
      handlers = {
        ["window/showMessage"] = function(err, method, params, client_id)
          print(vim.inspect(params))
        end,
      },
    })
    vim.lsp.enable("clangd")

    -- Lua Server (lua_ls)
    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua or {}, {
          runtime = {
            version = 'LuaJIT'
          },
          workspace = {
            checkThirdParty = "Apply",
          }
        })
      end,
      settings = {
        Lua = {}
      }
    })
    vim.lsp.enable("lua_ls")
  end,
}
