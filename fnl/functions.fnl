(local M {})

(lambda M.require-and [module callback]
  (callback (require module)))

M
