(local {: require-and} (require :functions))
(import-macros {: map!} :hibiscus.vim)

(local M { 1 :ThePrimeagen/harpoon
           :branch "harpoon2"
           :lazy false
           :config true
           :dependencies [:nvim-lua/plenary.nvim] })


(fn M.config []
  (local harpoon (require :harpoon))

  (harpoon.setup {})
  (map! [n] "<leader>'a" (fn [] (: (harpoon:list) :add)))
  (map! [n] "<leader>''" (fn [] (harpoon.ui:toggle_quick_menu (harpoon:list))))
  (map! [n] :<A-n> (fn [] (: (harpoon:list) :select 1)))
  (map! [n] :<A-e> (fn [] (: (harpoon:list) :select 2)))
  (map! [n] :<A-i> (fn [] (: (harpoon:list) :select 3)))
  (map! [n] :<A-o> (fn [] (: (harpoon:list) :select 4))))

M
