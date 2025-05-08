(import-macros {: map!} :hibiscus.vim)

(local M {1 :cbochs/grapple.nvim})

(fn M.config []
  (local grapple (require :grapple))
  (grapple.setup {:icons false :default_scopes {:git_branch true}})
  (map! [n] "<leader>'a" (fn [] (grapple.toggle)))
  (map! [n] "<leader>''" (fn [] (grapple.toggle_tags)))
  (map! [n] :<A-n> (fn [] (grapple.select {:index 1})))
  (map! [n] :<A-e> (fn [] (grapple.select {:index 2})))
  (map! [n] :<A-i> (fn [] (grapple.select {:index 3})))
  (map! [n] :<A-o> (fn [] (grapple.select {:index 4}))))

M

