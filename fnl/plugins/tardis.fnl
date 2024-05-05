(import-macros {: map!} :hibiscus.vim)

(local M { 1 :FredeEb/tardis.nvim 
       :dependencies [ :nvim-lua/plenary.nvim ]
       :config true
       })

(fn M.config [] 
  (local tardis (require :tardis-nvim))
  (tardis.setup {
                :keymap {
                  :next :p
                  :prev :n
                  :quit :q
                  :revision_message :<C-m>
                  :commit :<C-a>
                } })

  (map! [n] :<leader>gt :<cmd>Tardis<CR>))

M

