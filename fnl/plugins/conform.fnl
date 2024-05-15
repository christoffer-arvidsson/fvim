(import-macros {: map!} :hibiscus.vim)

(local M {1 :stevearc/conform.nvim
          :event [:BufReadPre :BufNewFile]
          :config true})

(fn M.config []
  (local conform (require :conform))
  (conform.setup {:formatters_by_ft {:fennel [:fnlfmt] :python [:isort :black]}})
  (map! [n] :<leader>bf
        (fn []
          (conform.format {:lsp_fallback true :async true :timeout_ms 500}))))

M

