(local {: require-and : file-exists?} (require :functions))

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

(require-and :lazy
             #($.setup :plugins
                       {:checker {:enabled true}
                       :performance {:rtp {:reset false}}
                       :change_detection {:enabled true :notify false}}))

(require :options)
