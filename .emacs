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
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(tool-bar-mode nil))
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
(set-default-font "WenQuanYi Micro Hei-12")
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
(setq tool-bar-mode)
;;
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
