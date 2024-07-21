(local {: require-and : file-exists-p} (require :functions))

(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))
(when (not ((. (or vim.uv vim.loop) :fs_stat) lazypath))
  (local lazyrepo "https://github.com/folke/lazy.nvim.git")
  (local out (vim.fn.system [:git
                             :clone
                             "--filter=blob:none"
                             :--branch=stable
                             lazyrepo
                             lazypath]))
  (when (not= vim.v.shell_error 0)
    (vim.api.nvim_echo [["Failed to clone lazy.nvim:\n" :ErrorMsg]
                        [out :WarningMsg]
                        ["\nPress any key to exit..."]]
                       true {})
    (vim.fn.getchar)
    (os.exit 1)))
(vim.opt.rtp:prepend lazypath)	

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
