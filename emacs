(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'load-path "~/.opam/system/share/emacs/site-lisp/")
(setq auto-mode-alist
  (append '(("\\.ml[ily]?$" . tuareg-mode)
  	    ("\\.eliom$" . tuareg-mode))
          auto-mode-alist))

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code." t)
(autoload 'camldebug "cameldeb" "Run the Caml debugger." t)

(setq column-number-mode t)

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)

;; Add opam emacs directory to the load-path
(setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null") 0 -1))
(add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
;; Load merlin-mode
(require 'merlin)
;; Start merlin on ocaml files
(add-hook 'tuareg-mode-hook 'merlin-mode t)
(add-hook 'caml-mode-hook 'merlin-mode t)
