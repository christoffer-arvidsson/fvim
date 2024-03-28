(local {: require-and} (require :functions))

(local M { 1 :NeogitOrg/neogit 
       :dependencies [:nvim-lua/plenary.nvim
                      :sindrets/diffview.nvim
                      :nvim-telescope/telescope.nvim]
       :config true
       :keys [{1 :<leader>gs 2 #(require-and :neogit #($.open))}]
       :lazy false})

(fn M.setup [] 
  (local neogit (require :neogit))
  (neogit.setup {}))

M
