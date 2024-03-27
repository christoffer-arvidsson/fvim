(local {: require-and} (require :functions))
(import-macros {: map!} :hibiscus.vim)

(lambda builtin [callback]
  (require-and :telescope.builtin callback))

(local M { 1 :nvim-telescope/telescope.nvim
       :tag "0.1.6"
       :lazy false
       :dependencies [:nvim-lua/plenary.nvim] 
       :keys [{1 :<leader>pf 2 #(builtin #($.find_files))
                 :desc "Project find files" }]
       })

M


