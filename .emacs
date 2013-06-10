;;==========================================
;;            My Emacs Config
;;==========================================
;;
;(setq initial-frame-alist 
;	  '((width . 72) (height . 36)))
;;
;;== User ==
;(setq user-full-name "nplx")
;(setq user-mail-address "nplx@nplx.tk")
;;
;;== Add load path ==
(add-to-list 'load-path "~/.emacs.d/")
;;
;;== EasyPG: GPG support (decrypt in buffer; save encrypted) ==
(require 'epa-file)
(epa-file-enable)
(setq epa-armor t) ; use ASCII armored encryption
(custom-set-variables '(epa-file-name-regexp "\\.\\(asc\\|gpg\\|gpg~\\|asc~\\)\\'"))
(custom-set-variables '(ibus-python-shell-command-name "python2"))
;;
;;== tramp ==
(require 'tramp)
(setq tramp-default-method "scp")
;;
;;== Matching pairs of parentheses ==
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
;;
;;== Use "Shift+Space" to "Mark" ==
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)
;; 
;;== No backup file ==
(setq make-backup-files nil)
;;
;;== Set directory of backup files ==
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ibus-python-shell-command-name "python2")
; '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
; '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(tool-bar-mode nil))
;;
;;== Auto-complete ==
(add-to-list 'load-path "/usr/share/emacs/site-lisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/usr/share/emacs/site-lisp//ac-dict")
(ac-config-default)
;;
;;== Set theme ==
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
;;(color-theme-lawrence)
;;(color-theme-euphoria)
(color-theme-deep-blue)
;;
;;== Dispaly time ==
(display-time-mode t)
;;
;;== tab and ido-mode  ==
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(ido-mode t)
;;
;;== Org mode ==
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
;;
;;== Enable column number ==
(column-number-mode t)
;;
;;== Enable line number ==
(global-linum-mode t)
;;== Enable auto fill mode ==
(setq auto-fill-mode t)
;;
;;== Set the fill column ==
;;(setq fill-column 72)
;;
;;== Font ==
(set-default-font "Envy Code R for Powerline-10")
;(set-default-font "WenQuanYi Zen Hei Mono-12")
;(set-default-font "YaHei Consolas Hybrid-10")
;(set-frame-font "DejaVu Sans Mono-10")
;(set-frame-font "Inconsolata-12")
;;
;;== Highlight the current line ==
;;(global-hl-line-mode t)
;;
;;== Global visual line==
(global-visual-line-mode t)
;;== Line-by-line scrolling == 
;(setq scroll-step 1)
;;
;;== Enable wheel scrolling == 
;(mouse-wheel-mode t)
;;
;;== Hide tool bar ==
(setq tool-bar-mode)
;;
;;== Display pictures ==
(auto-image-file-mode)
;;
;;
;;== el-get ==
;;
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(el-get 'sync)
;;
;;== ibus-el ==
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;;(global-set-key (kbd "C-\\" 'ibus-toggle))
(setq ibus-agent-file-name "/usr/share/emacs/site-lisp/ibus/ibus-el-agent")
;;(setq ibus-agent-file-name "~/.emacs.d/el-get/ibus/ibus-el-agent")
;;
;;== autopair ==
(require 'autopair)
(autopair-global-mode)
;;
;;== YASnippet ==
(require 'yasnippet)
;;
;;== Emacs-w3m ==
(require 'w3m-load)
(setq w3m-use-favicon nil)
(setq w3m-command-arguments '("-cookie" "-F"))
(setq w3m-use-cookies t)
(setq w3m-toggle-inline-image t)
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m "w3m" "Interface for w3m on Emacs." t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
(global-set-key "\C-xm" 'browse-url-at-point)
(setq w3m-view-this-url-new-session-in-background t)
