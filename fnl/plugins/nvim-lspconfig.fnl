(local {: require-and} (require :functions))

(local M { 1 "neovim/nvim-lspconfig" 
       :event :BufReadPost
       :dependencies [:mason.nvim]
       :init (fn []
               (set vim.lsp.set_log_level :trace)
               (require-and :vim.lsp.log #($.set_format_func vim.inspect)))})

(fn M.config []
  (local mason (require :mason))
  (local lspconfig (require :lspconfig))
  (lspconfig.pyright.setup {})
  (lspconfig.rust_analyzer.setup {})
  (lspconfig.fennel_ls.setup {}))
                       
M
