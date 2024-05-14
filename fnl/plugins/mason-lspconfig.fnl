(local M { 1 "williamboman/mason-lspconfig.nvim" })

(fn M.config []
  (local mason-lspconfig (require :mason-lspconfig))
  (mason-lspconfig.setup 
   {:ensure_installed [ :rust_analyzer :clangd :pyright :fennel_language_server ]}))

M
