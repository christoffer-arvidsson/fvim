(import-macros {: map!} :hibiscus.vim)

(local M { 1 :mbbill/undotree 
       :config true })

(fn M.config [] 
  (map! [n] :<leader>ou vim.cmd.UndotreeToggle))

M
