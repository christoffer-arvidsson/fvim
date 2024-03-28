(import-macros {: map!} :hibiscus.vim)

(map! [n] :<leader>wm :<C-w>h "Select window left")
(map! [n] :<leader>wn :<C-w>j "Select window down")
(map! [n] :<leader>we :<C-w>k "Select window up")
(map! [n] :<leader>wi :<C-w>l "Select window right")

(map! [n] :<leader>wv :<C-w>v "Split vertically")
(map! [n] :<leader>ws :<C-w>s "Split horizontally")

(map! [n] :<leader>wq :<cmd>q<CR> "Quit window")

(map! [n] :<Esc> :<cmd>nohlsearch<CR>)

(map! [n] "[d" vim.diagnostic.goto_prev)
(map! [n] "]d" vim.diagnostic.goto_next)
(map! [n] :<leader>e vim.diagnostic.open_float)
(map! [n] :<leader>lE vim.diagnostic.open_float)
(map! [n] :<leader>lq vim.diagnostic.setloclist)

