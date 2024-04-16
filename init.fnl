(local {: require-and : file-exists-p} (require :functions))

(let [lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim)]
  (when (not (vim.loop.fs_stat lazypath))
    (vim.fn.system [:git
                     :clone
                     "--filter=blog:none"
                     :--single-branch
                     "https://github.com/folke/lazy.nvim.git"
                     lazypath]))
  (vim.opt.runtimepath:prepend lazypath))

(require :globals)
(require :bindings)
(require :options)

(require-and :lazy #($.setup :plugins
                             {:checker {:enabled true :notify false}
                             :performance {:rtp {:reset false}}
                             :change_detection {:enabled true :notify false}}))

(let [user-file (.. (vim.fn.stdpath :config) :/lua/user/init.lua)]
  (when (file-exists-p user-file)
    (require :user)))
