(local {: require-and} (require :functions))

(local M { 1 :NeogitOrg/neogit 
       :dependencies [:nvim-lua/plenary.nvim
                      :sindrets/diffview.nvim
                      :nvim-telescope/telescope.nvim]
       :config true
       :keys [{1 :<leader>gs 2 #(require-and :neogit #($.open))}]
       :lazy false})

(fn M.config [] 
  (local neogit (require :neogit))
  (neogit.setup 
    {:auto_refresh true
          :auto_show_console true
          :commit_editor {:kind :auto}
          :commit_select_view {:kind :tab}
          :commit_view {:kind :vsplit
                        :verify_commit (= (os.execute "which gpg") 0)}
          :console_timeout 2000
          :disable_context_highlighting false
          :disable_hint true
          :disable_insert_on_commit :auto
          :disable_line_numbers true
          :disable_signs false
          :filewatcher {:enabled true :interval 1000}
          :git_services {:bitbucket.org "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1"
                         :github.com "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1"
                         :gitlab.com "https://gitlab.com/${owner}/${repository}/merge_requests/new?merge_request[source_branch]=${branch_name}"}
          :graph_style :ascii
          :highlight {:bold true :italic true :underline true}
          :ignored_settings [:NeogitPushPopup--force-with-lease
                             :NeogitPushPopup--force
                             :NeogitPullPopup--rebase
                             :NeogitCommitPopup--allow-empty
                             :NeogitRevertPopup--no-edit]
          :integrations {:diffview nil :fzf_lua nil :telescope nil}
          :kind :tab
          :log_view {:kind :tab}
          :mappings {:commit_editor {:<c-c><c-c> :Submit
                                     :<c-c><c-k> :Abort
                                     :q :Close}
                     :finder {:<c-c> :Close
                              :<c-j> :NOP
                              :<c-n> :Next
                              :<c-p> :Previous
                              :<cr> :Select
                              :<down> :Next
                              :<esc> :Close
                              :<s-tab> :MultiselectTogglePrevious
                              :<tab> :MultiselectToggleNext
                              :<up> :Previous}
                     :popup {:? :HelpPopup
                             :A :CherryPickPopup
                             :d :DiffPopup
                             :M :RemotePopup
                             :p :PushPopup
                             :O :ResetPopup
                             :z :StashPopup
                             :b :BranchPopup
                             :c :CommitPopup
                             :f :FetchPopup
                             :l :LogPopup
                             :m :MergePopup
                             :F :PullPopup
                             :r :RebasePopup
                             :_ :RevertPopup
                             :Z :WorktreePopup}
                     :rebase_editor {:<c-c><c-c> :Submit
                                     :<c-c><c-k> :Abort
                                     :<cr> :OpenCommit
                                     :b :Break
                                     :d :Drop
                                     :e :Edit
                                     :f :Fixup
                                     :gj :MoveDown
                                     :gk :MoveUp
                                     :p :Pick
                                     :q :Close
                                     :r :Reword
                                     :s :Squash
                                     :x :Execute}
                     :status {:$ :CommandHistory
                              :1 :Depth1
                              :2 :Depth2
                              :3 :Depth3
                              :4 :Depth4
                              :<c-r> :RefreshBuffer
                              :<c-s> :StageAll
                              :<c-t> :TabOpen
                              :<c-v> :VSplitOpen
                              :<c-x> :SplitOpen
                              :<enter> :GoToFile
                              :<tab> :Toggle
                              :I :InitRepo
                              :S :StageUnstaged
                              :U :UnstageStaged
                              :Y :YankSelected
                              :q :Close
                              :s :Stage
                              :u :Unstage
                              :x :Discard
                              "{" :GoToPreviousHunkHeader
                              "}" :GoToNextHunkHeader}}
          :merge_editor {:kind :auto}
          :popup {:kind :split}
          :preview_buffer {:kind :split}
          :rebase_editor {:kind :auto}
          :reflog_view {:kind :tab}
          :remember_settings true
          :sections {:rebase {:folded true :hidden false}
                     :recent {:folded true :hidden false}
                     :sequencer {:folded false :hidden false}
                     :staged {:folded false :hidden false}
                     :stashes {:folded true :hidden false}
                     :unmerged_pushRemote {:folded false :hidden false}
                     :unmerged_upstream {:folded false :hidden false}
                     :unpulled_pushRemote {:folded true :hidden false}
                     :unpulled_upstream {:folded true :hidden false}
                     :unstaged {:folded false :hidden false}
                     :untracked {:folded false :hidden false}}
          :signs {:hunk ["" ""] :item [">" :v] :section [">" :v]}
          :sort_branches :-committerdate
          :status {:recent_commit_count 10}
          :tag_editor {:kind :auto}
          :telescope_sorter (fn []
                              ((. (. (. (require :telescope) :extensions) :fzf)
                                  :native_fzf_sorter)))
          :use_default_keymaps true
          :use_per_project_settings true}))

M
