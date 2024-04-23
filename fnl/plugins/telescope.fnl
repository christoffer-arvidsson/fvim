(import-macros {: map!} :hibiscus.vim)

(local M { 1 :nvim-telescope/telescope.nvim
       :tag "0.1.6"
       :lazy false
       :config true
       :dependencies [:nvim-lua/plenary.nvim 
                       {1 :nvim-telescope/telescope-fzf-native.nvim 
                       :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" } 
                       ] 
       })


(fn M.config [] 

  (local telescope (require :telescope))
  (telescope.setup {
                   :extensions {
                     :fzf {
                       :fuzzy true
                       :override_generic_sorter true
                       :override_file_sorter true
                       :case_mode :smart_case
                     }
                   }
                   :pickers { 
                     :find_files { :theme :ivy }
                     :help_tags { :theme :ivy }
                     :keymaps { :theme :ivy }
                     :grep_string { :theme :ivy }
                     :live_grep { :theme :ivy }
                     :diagnostics { :theme :ivy }
                     :oldfiles { :theme :ivy }
                     :buffers { :theme :ivy }
                     :lsp_references { :theme :ivy }
                     :lsp_incoming_calls { :theme :ivy }
                     :lsp_outgoing_calls { :theme :ivy }
                     :lsp_document_symbols { :theme :ivy }
                     :lsp_workspace_symbols { :theme :ivy }
                     :lsp_diagnostics { :theme :ivy }
                     :lsp_definitions { :theme :ivy }
                     :lsp_type_definitions { :theme :ivy }
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


  (local telescope (require :telescope))
  (local builtin (require :telescope.builtin))
  (local utils (require :telescope.utils))

  (telescope.load_extension :fzf)

  (map! [n] :<leader>ht builtin.help_tags)
  (map! [n] :<leader>hm builtin.keymaps)
  (map! [n] :<leader>pf 
        (fn [] (builtin.find_files {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel") 1) 
                                   :hidden true :ignore true })))
  (map! [n] :<leader>ff (fn [] (builtin.find_files {:cwd (utils.buffer_dir) :hidden true :ignore true })))
  (map! [n] :<leader>hh builtin.builtin)
  (map! [n] :<leader>s/ (fn [] (builtin.live_grep {:cwd (utils.buffer_dir)})))
  (map! [n] :<leader>/ (fn [] (builtin.live_grep {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel") 1) })))
  (map! [n] :<leader>le builtin.diagnostics)
  (map! [n] :<leader>fr builtin.oldfiles)
  (map! [n] :<leader>bb builtin.buffers))

M


