;;==========================================
;;            My Emacs Config
;;==========================================
;;
;;
;;== Frame size (Somehow very slow)==
;;(setq default-frame-alist
;;	'((top . 40) (left . 6)
;;	  (width . 100) (height . 36)
;;	  (font . "")
;;	  ))
(setq initial-frame-alist 
	  '((width . 72) (height . 36)))
;;
;;== User ==
(setq user-full-name "Charles Gu")
(setq user-mail-address "nplx@nplx.tk")
;;
;;== tramp ==
(require 'tramp)
(setq tramp-default-method "scp")
;;
;;== Cua-mode ==
;;(cua-mode 1)
;;
;;== Matching pairs of parentheses ==
(show-paren-mode t)
(setq show-paren-style 'parentheses)
;;
;;== Use "Shift+Space" to "Mark" ==
(global-unset-key (kbd "C-SPC"))
(global-set-key (kbd "M-SPC") 'set-mark-command)
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
 '(ibus-python-shell-command-name "python2")
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(column-number-mode t)
 '(tool-bar-mode nil))
;;
;;== Add load path ==
(add-to-list 'load-path "~/.emacs.d/")
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
;;(color-theme-comidia)
(color-theme-deep-blue)
;;(color-theme-oswald)
;;(color-theme-hober)
;;(color-theme-matrix)
;;
;;== Dispaly time ==
(display-time-mode t)
;;
;;== tab and ido-mode  ==
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
;;(ido-mode t)
;;
;;== LaTex ==
;;
;;
;;== Org mode ==
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/Org/Web_learn_todo.org"
                            "~/Org/Regular_todo.org"
                            "~/Org/foobar.org"))
;;
;;== ibus-el ==
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
(setq ibus-agent-file-name "/usr/share/emacs/site-lisp/ibus/ibus-el-agent")
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
;(set-default-font "WenQuanYi Zen Hei Mono-12")
(set-default-font "WenQuanYi Bitmap Song-8")
;(set-frame-font "DejaVu Sans Mono-10")
;(set-frame-font "Inconsolata-12")
;;
;;== Highlight the current line ==
;;(global-hl-line-mode t)
;;
;;== ==
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
(add-to-list 'load-path "~/.emacs.d/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(el-get 'sync)
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
;;== erc ==
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/erc/")
;;(require 'erc)
;;== mutt ==
;(server-start)
;(autoload 'post-mode "post" "mode for e-mail" t)
;(add-to-list 'auto-mode-alist
;             '("\\.*mutt-*\\|.article\\|\\.followup"
;               .post-mode))
;(add-hook 'post-mode-hook
;          (lambda()
;          (auto-fill-mode t)
;          (setq fill-colum 72)
;          (require 'footnote-mode)
;          (footmode-mode t)
;          (add-to-list 'load-path ;"~/.emacs.d/el-get/boxquote")
;          (require 'boxquote)))
