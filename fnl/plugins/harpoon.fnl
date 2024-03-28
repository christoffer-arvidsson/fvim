(local {: require-and} (require :functions))
(import-macros {: map!} :hibiscus.vim)

(fn harp [callback]
  (require-and :harpoon callback))

(local M { 1 :ThePrimeagen/harpoon
           :branch "harpoon2"
           :lazy false
           :dependencies [:nvim-lua/plenary.nvim] })


(fn M.config []
  (local harpoon (require :harpoon))
  (map! [n] :<leader>ha (fn [] (: (harpoon:list) :append)))
  (map! [n] :<leader>hh (fn [] (harpoon.ui:toggle_quick_menu (harpoon:list))))
  (map! [n] :<A-n> (fn [] (: (harpoon:list) :select 1)))
  (map! [n] :<A-e> (fn [] (: (harpoon:list) :select 2)))
  (map! [n] :<A-i> (fn [] (: (harpoon:list) :select 3)))
  (map! [n] :<A-o> (fn [] (: (harpoon:list) :select 4))))

M
