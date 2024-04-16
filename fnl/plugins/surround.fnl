(local M { 1 :kylechui/nvim-surround 
       :config true})

(fn M.config [] 
  (local surround (require :nvim-surround))
  (surround.setup {}))

M
