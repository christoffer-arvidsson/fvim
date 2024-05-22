(import-macros {: map!} :hibiscus.vim)

(local M {1 :kelly-lin/ranger.nvim
       :config true})

(fn M.config []
  (local ranger (require :ranger-nvim) )
  (map! [n] :<leader>or ranger.open))

M

