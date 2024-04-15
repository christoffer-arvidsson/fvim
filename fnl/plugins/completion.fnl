(local M { 1 :hrsh7th/nvim-cmp 
       :dependencies [:hrsh7th/cmp-nvim-lsp
                      :hrsh7th/cmp-path]
       })

(fn M.config []
  (local cmp (require :cmp))
  (cmp.setup {
             :completion {:completeopt "menu,menuone,noinsert"}
             :sources [
             {:name :nvim_lsp}
             {:name :path}
             ]}))

M

