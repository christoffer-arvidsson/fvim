
(local M {1 :rose-pine/neovim
       :as :rose-pine
       :priority 1000
       :dependencies [ {1 :typicode/bg.nvim :lazy false} ]
       :init (fn []
               (vim.cmd.colorscheme :rose-pine-main))
})

M
