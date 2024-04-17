(local {: require-and} (require :functions))

(local M { 1 "neovim/nvim-lspconfig" 
       :event :BufReadPost
       :dependencies [:mason.nvim :telescope.nvim]
       :init (fn []
               (set vim.lsp.set_log_level :trace)
               (require-and :vim.lsp.log #($.set_format_func vim.inspect)))})

(fn M.config []
  (local lspconfig (require :lspconfig))

  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [event]
                                            (fn map [keys func desc]
                                              (vim.keymap.set :n keys func
                                                              {:buffer event.buf
                                                              :desc (.. "LSP: "
                                                                        desc)}))

                                            (map :gd (. (require :telescope.builtin) :lsp_definitions) "[G]oto [D]efinition")
                                            (map :gr (. (require :telescope.builtin) :lsp_references) "[G]oto [R]eferences")
                                            (map :gI (. (require :telescope.builtin) :lsp_implementations) "[G]oto [I]mplementation")
                                            (map :<leader>lD (. (require :telescope.builtin) :lsp_type_definitions) "Type [D]efinition")
                                            (map :<leader>ls (. (require :telescope.builtin) :lsp_document_symbols) "[D]ocument [S]ymbols")
                                            (map :<leader>lw (. (require :telescope.builtin) :lsp_dynamic_workspace_symbols) "[W]orkspace [S]ymbols")
                                            (map :<leader>lR vim.lsp.buf.rename "[R]e[n]ame")
                                            (map :<leader>la vim.lsp.buf.code_action "[C]ode [A]ction")
                                            (map :K vim.lsp.buf.hover "Hover Documentation")
                                            (map :gD vim.lsp.buf.declaration "[G]oto [D]eclaration")
                                            (local client (vim.lsp.get_client_by_id event.data.client_id))
                                            (when (and client client.server_capabilities.documentHighlightProvider)
                                              (vim.api.nvim_create_autocmd [:CursorHold :CursorHoldI] {:buffer event.buf :callback vim.lsp.buf.document_highlight})
                                              (vim.api.nvim_create_autocmd [:CursorMoved :CursorMovedI] {:buffer event.buf :callback vim.lsp.buf.clear_references})))
                               :group (vim.api.nvim_create_augroup :fvim-lsp-attach {:clear true})})	


  (lspconfig.clangd.setup {})
  (lspconfig.rust_analyzer.setup {})
  (lspconfig.fennel_ls.setup {})
  (lspconfig.pyright.setup {}))
                       
M
