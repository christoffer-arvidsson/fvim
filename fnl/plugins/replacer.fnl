(import-macros {: map!} :hibiscus.vim)

(local M {1 :gabrielpoca/replacer.nvim :config true})

(fn M.config [] 
          (map! [n] :<leader>si "<cmd>lua require('replacer').run()<cr>"))

M

