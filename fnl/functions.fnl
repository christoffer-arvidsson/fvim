(local M {})

(lambda M.require-and [module callback]
  (callback (require module)))

(lambda M.file-exists-p [file]
  (> (vim.fn.filereadable file) 0))

M
