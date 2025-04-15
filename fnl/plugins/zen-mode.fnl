(import-macros {: map!} :hibiscus.vim)

(local M {1 :folke/zen-mode.nvim
          :opts {:backdrop 1.0 :plugins {:alacritty {:enabled true}}}})

(fn M.config []
  (map! [n] :<leader>tz :<cmd>ZenMode<CR>))

M

