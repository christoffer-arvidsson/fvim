(local {: require-and} (require :functions))

(local M {1 :echasnovski/mini.nvim
       :config true })

(fn M.config [] 
 (require-and :mini.ai #($.setup {:n_lines 500}))
 (require-and :mini.surround #($.setup {}))

 (local statusline (require :mini.statusline))
 (statusline.setup { :use_icons vim.g.have_nerd_font}))

M

