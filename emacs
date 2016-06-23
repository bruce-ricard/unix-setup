(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-to-list 'load-path "~/.opam/system/share/emacs/site-lisp/")
(setq auto-mode-alist
  (append '(("\\.ml[ily]$" . tuareg-mode)
  	    ("\\.eliom$" . tuareg-mode))
          auto-mode-alist))

(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code." t)
(autoload 'camldebug "cameldeb" "Run the Caml debugger." t)

(setq column-number-mode t)

(show-paren-mode 1)

(setq-default indent-tabs-mode nil)
