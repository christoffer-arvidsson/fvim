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
               {:name :path}]
             :mapping (cmp.mapping.preset.insert {:<C-Space> (cmp.mapping.complete {})
                                                 :<C-b> (cmp.mapping.scroll_docs (- 4))
                                                 :<C-f> (cmp.mapping.scroll_docs 4)
                                                 ; :<C-h> (cmp.mapping (fn []
                                                 ;                       (when (luasnip.locally_jumpable (- 1))
                                                 ;                         (luasnip.jump (- 1))))
                                                 ;                     [:i :s])
                                                 ; :<C-l> (cmp.mapping (fn []
                                                 ;                       (when (luasnip.expand_or_locally_jumpable)
                                                 ;                         (luasnip.expand_or_jump)))
                                                 ;                     [:i :s])
                                                 :<C-n> (cmp.mapping.select_next_item)
                                                 :<C-p> (cmp.mapping.select_prev_item)
                                                 :<CR> (cmp.mapping.confirm {:select true})
                                                 :<tab> (cmp.mapping.confirm {:select true})})	
             }))

M

