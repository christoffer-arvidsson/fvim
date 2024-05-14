(import-macros {: map!} :hibiscus.vim)

(fn dadbod-config []
  (map! [n] :<leader>od :<cmd>DBUIToggle<CR>))

(local M [
        { 1 :tpope/vim-dadbod :config dadbod-config}
        { 1 :kristijanhusak/vim-dadbod-completion }
        { 1 :kristijanhusak/vim-dadbod-ui }])

M
