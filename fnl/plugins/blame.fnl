(import-macros {: map!} :hibiscus.vim)

(local M { 1 :f-person/git-blame.nvim
       :config true})

(fn M.config [] 
  (local blame (require :gitblame))
  (blame.setup {:enabled false})

  (map! [n] :<leader>gB :<cmd>GitBlameToggle<CR>))

M

