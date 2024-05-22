(import-macros {: map!} :hibiscus.vim)

(map! [n] :<leader>wm :<C-w>h "Select window left")
(map! [n] :<leader>wn :<C-w>j "Select window down")
(map! [n] :<leader>we :<C-w>k "Select window up")
(map! [n] :<leader>wi :<C-w>l "Select window right")
(map! [n] :<leader>wv :<C-w>v "Split vertically")
(map! [n] :<leader>ws :<C-w>s "Split horizontally")
(map! [n] :<leader>w= :<C-W>=)

(map! [n] :<leader>wq :<cmd>q<CR> "Quit window")

(map! [n] :<Esc> :<cmd>nohlsearch<CR>)

(map! [n] "[d" vim.diagnostic.goto_prev)
(map! [n] "]d" vim.diagnostic.goto_next)
(map! [n] :<leader>e vim.diagnostic.open_float)
(map! [n] :<leader>lq vim.diagnostic.setloclist)

(map! [v] :<M-down> ":m '>+1<CR>gv=gv")
(map! [v] :<M-up> ":m '>-2<CR>gv=gv")
(map! [n] :J "mzJ`z")

(map! [n] :<leader>ol :<cmd>Lazy<CR>)

(map! [n] :<leader>br :<cmd>edit!<CR>)
(map! [n] :<leader>bf vim.lsp.buf.format)
(map! [n] :<leader>bn :<cmd>enew<CR>)

(map! [n] :<leader>fy "<cmd>call setreg('+', expand('%'))<CR>")
(map! [n] :<leader>fY "<cmd>let @+=expand('%:p')<CR>")

(map! [n] :<M-g>n :<cmd>cnext<CR>)
(map! [n] :<M-g>p :<cmd>cprev<CR>)

(map! [n] :<leader>qr "<cmd>luafile ~/.config/nvim/init.lua<CR>")
