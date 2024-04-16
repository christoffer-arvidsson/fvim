(import-macros {: map!} :hibiscus.vim)

(local M { 1 :nvim-telescope/telescope.nvim
       :tag "0.1.6"
       :lazy false
       :config true
       :dependencies [:nvim-lua/plenary.nvim] 
       })


(fn M.config [] 

  (local telescope (require :telescope))
  (telescope.setup {
                   :pickers { 
                     :find_files { :theme :ivy }
                     :help_tags { :theme :ivy }
                     :keymaps { :theme :ivy }
                     :grep_string { :theme :ivy }
                     :live_grep { :theme :ivy }
                     :diagnostics { :theme :ivy }
                     :oldfiles { :theme :ivy }
                     :buffers { :theme :ivy }
                   }
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
  (local utils (require :telescope.utils))

  (map! [n] :<leader>ht builtin.help_tags)
  (map! [n] :<leader>hm builtin.keymaps)
  (map! [n] :<leader>pf 
        (fn [] (builtin.find_files {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel") 1) 
                                   :hidden true :ignore true })))
  (map! [n] :<leader>ff (fn [] (builtin.find_files {:cwd (utils.buffer_dir) :hidden true :ignore true })))
  (map! [n] :<leader>hh builtin.builtin)
  (map! [n] :<leader>s/ builtin.grep_string)
  (map! [n] :<leader>/ builtin.live_grep)
  (map! [n] :<leader>le builtin.diagnostics)
  (map! [n] :<leader>fr builtin.oldfiles)
  (map! [n] :<leader>bb builtin.buffers))

M


