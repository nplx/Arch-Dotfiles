;;==========================================
;;            My Emacs Config
;;==========================================
;;
;;== Use "Shift+Space" to "Mark" ==
;(global-set-key [?\S-] 'set-mark-command)
;;
;;== No backup file ==
;;(setq make-backup-files nil)
;;
;;== Set directory of backup files ==
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/backups/"))))
;;
;;== Add load path ==
(add-to-list 'load-path "~/.emacs.d/")
;;
;;== Set theme ==
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(color-theme-matrix)
;;
;;== Enable column number ==
(column-number-mode 1)
;;
;;== Enable auto fill mode ==
;;(setq auto-fill-mode 1)
;;
;;== Set the fill column ==
;;(setq fill-column 72)
;;
;;== Font ==
;;(set-default-font "Monaco-10")
;;
;;== Highlight the current line ==
;;(global-hl-line-mode 1)
;;
;;== Line-by-line scrolling == 
;(setq scroll-step 1)
;;
;;== Enable wheel scrolling == 
;(mouse-wheel-mode t)
;;
;;== Hide tool bar ==
(tool-bar-mode)
;;
