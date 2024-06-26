(import-macros {: map!} :hibiscus.vim)

(local M {1 :luckasRanarison/nvim-devdocs
          :config true
          :dependencies [:nvim-lua/plenary.nvim
                         :nvim-telescope/telescope.nvim
                         :nvim-treesitter/nvim-treesitter]})

(fn M.config []
  (local devdocs (require :nvim-devdocs))
  (devdocs.setup {})
  (map! [n] :<leader>hd :<cmd>DevdocsOpen<cr>))

M

