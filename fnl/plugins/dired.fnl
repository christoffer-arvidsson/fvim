(import-macros {: map!} :hibiscus.vim)
(local {: project-root} (require :functions))

(local M { 1 :X3eRo0/dired.nvim
       :lazy false 
       :config true
       :dependencies [ "MunifTanjim/nui.nvim" ]})

(fn M.dired-current-dir [] 
  (let [dired (require :dired)]
    (dired.open (vim.fn.expand "%:p:h"))))

(fn M.dired-project-root []
  (let [dired (require :dired)]
    (dired.open (project-root))))

(fn M.config []
  (local dired (require :dired))
  (dired.setup {:keybinds { :dired_back "^" :dired_quit "q" }
                :show_hidden true
                :show_dot_dirs true
                :show_icons true 
                :show_colors true})

  (map! [n] :<leader>. M.dired-current-dir)
  (map! [n] :<leader>p. M.dired-project-root))

M
