
(local M { 1 :X3eRo0/dired.nvim
       :lazy false 
       :config true
       :keys [{1 :<leader>. 2 :<cmd>Dired<CR> :desc "Open dired" }]
       :dependencies [ "MunifTanjim/nui.nvim" ]})


(fn M.config []
  (local dired (require :dired))
  (dired.setup {:keybinds { :dired_back "^" :dired_quit "q" }
                :show_icons true 
                :show_colors true}))

M
