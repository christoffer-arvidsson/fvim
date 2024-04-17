
(local M {1 :rose-pine/neovim
       :as :rose-pine
       :priority 1000
       :dependencies [ {1 :typicode/bg.nvim :lazy false} ]
       :config true
})

(fn M.config [] 
  (local rose-pine (require :rose-pine))
  (rose-pine.setup {
                   :before_highlight (fn [group highlight palette])
                   :dark_variant :main
                   :dim_inactive_windows false
                   :enable {:legacy_highlights true :migrations true :terminal true}
                   :extend_background_behind_borders true
                   :groups {:border :muted
                   :error :love
                   :git_add :foam
                   :git_change :rose
                   :git_delete :love
                   :git_dirty :rose
                   :git_ignore :muted
                   :git_merge :iris
                   :git_rename :pine
                   :git_stage :iris
                   :git_text :rose
                   :git_untracked :subtle
                   :h1 :iris
                   :h2 :foam
                   :h3 :rose
                   :h4 :gold
                   :h5 :pine
                   :h6 :foam
                   :hint :iris
                   :info :foam
                   :link :iris
                   :note :pine
                   :panel :surface
                   :todo :rose
                   :warn :gold}
                   :highlight_groups {}
                   :styles {:bold true :italic false :transparency false}
                   :variant :auto})

  (vim.cmd.colorscheme :rose-pine-main))

M
