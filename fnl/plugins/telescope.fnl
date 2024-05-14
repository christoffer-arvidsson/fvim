(import-macros {: map!} :hibiscus.vim)

(local M { 1 :nvim-telescope/telescope.nvim
       :tag "0.1.6"
       :lazy false
       :config true
       :dependencies [:nvim-lua/plenary.nvim 
                      { 1 :nvim-telescope/telescope-fzf-native.nvim 
                      :build "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" } 
                      { 1 :nvim-telescope/telescope-file-browser.nvim } ] })

(fn M.config [] 

  (local telescope (require :telescope))
  (local fb_actions telescope.extensions.file_browser.actions)
  (telescope.setup {
                   :extensions {
                     :fzf {
                       :fuzzy true
                       :override_generic_sorter true
                       :override_file_sorter true
                       :case_mode :smart_case
                     }
                     :file_browser {
                       :theme :ivy
                       :mappings {
                         :i {
                           :^ fb_actions.goto_parent_dir
                         }
                       }
                     }
                   }
                   :defaults {
                     :border true
                     ; :borderchars ["-" " " "-" " " "-" " " " " "-"]
                     :borderchars [" " " " "─" " " " " " " " " "─"]
                     :layout_config {  ;; Layout that resembles emacs's vertico+consult
                       :anchor :S
                       :prompt_position :bottom
                       :width {:padding 0}
                       :height 0.99
                       :preview_height 0.5
                     }
                     :layout_strategy :vertical
                     :file_ignore_patterns [ ".git" ]
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

  (telescope.load_extension :fzf)
  (telescope.load_extension :file_browser)

  (map! [n] :<leader>ht builtin.help_tags)
  (map! [n] :<leader>hm builtin.keymaps)
  (map! [n] :<leader>pf 
        (fn [] (builtin.find_files {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel") 1) 
                                   :hidden true :ignore true })))
  (map! [n] :<leader>ff (fn [] (telescope.extensions.file_browser.file_browser {:cwd (utils.buffer_dir) :hidden true :ignore true })))
  (map! [n] :<leader>hh builtin.builtin)
  (map! [n] :<leader>s/ (fn [] (builtin.live_grep {:cwd (utils.buffer_dir)})))
  (map! [n] :<leader>/ (fn [] (builtin.live_grep {:cwd (. (vim.fn.systemlist "git rev-parse --show-toplevel") 1) })))
  (map! [n] :<leader>sb builtin.current_buffer_fuzzy_find)
  (map! [n] :<leader>le builtin.diagnostics)
  (map! [n] :<leader>fr builtin.oldfiles)
  (map! [n] :<leader>bb builtin.buffers))

M


