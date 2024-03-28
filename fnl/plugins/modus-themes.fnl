(local M {1 :miikanissi/modus-themes.nvim :priority 1000 })

(fn M.config [] 
  (local modus-themes (require :modus-themes))
  (vim.cmd "colorscheme modus"))

M
