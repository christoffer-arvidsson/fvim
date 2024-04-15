(local {: require-and} (require :functions))
(import-macros {: map!} :hibiscus.vim)

(lambda builtin [callback]
  (require-and :telescope.builtin callback))

(local M { 1 :nvim-telescope/telescope.nvim
       :tag "0.1.6"
       :lazy false
       :config true
       :dependencies [:nvim-lua/plenary.nvim] 
       })

(fn M.config [] 

  (local telescope (require :telescope))
  (telescope.setup {
                   :defaults {
                   :vimgrep_arguments [
                                       "rg"
                                       "--color=never"
                                       "--no-heading"
                                       "--with-filename"
                                       "--line-number"
                                       "--column"
                                       "--smart-case"
                                       "--no-ignore"
                                       "--hidden" ] 
                   :find_command { :hidden true }
                   }})

  (local builtin (require :telescope.builtin))
  (map! [n] :<leader>ht builtin.help_tags)
  (map! [n] :<leader>hm builtin.keymaps)
  (map! [n] :<leader>pf (fn [] (builtin.find_files {:hidden true :ignore true})))
  (map! [n] :<leader>hh builtin.builtin)
  (map! [n] :<leader>s/ builtin.grep_string)
  (map! [n] :<leader>/ builtin.live_grep)
  (map! [n] :<leader>le builtin.diagnostics)
  (map! [n] :<leader>fr builtin.oldfiles)
  (map! [n] :<leader>bb builtin.buffers))

M


