(import-macros {: map!} :hibiscus.vim)

(local M { 1 :folke/trouble.nvim :lazy false :config true} )

(fn M.config [] 
  (local trouble (require :trouble))
  (trouble.setup {})
  (map! [n] :<leader>xx trouble.toggle)
  (map! [n] :<leader>xw (fn [] (trouble.toggle "workspace_diagnostics")))
  (map! [n] :<leader>xd (fn [] (trouble.toggle "document_diagnostics")))
  (map! [n] :<leader>xq (fn [] (trouble.toggle "quickfix")))
  (map! [n] :<leader>xl (fn [] (trouble.toggle "loclist")))
  (map! [n] :gr (fn [] (trouble.toggle "lsp_references"))))
 
M

