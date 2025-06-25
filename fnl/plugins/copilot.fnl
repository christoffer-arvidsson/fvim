(local M [
          {1 :zbirenbaum/copilot.lua :config true}
          {1 :zbirenbaum/copilot-cmp :config true}])

(fn M.config []
  (local cp (require :copilot))
  (local cp-cmp (require :copilot-cmp))
  (cp.setup {
            :suggestions { :enabled false }
            :panel {:enabled false}
            })

  (cp-cmp.setup {}))
        
M
