;;==========================================
;;          My Emacs Config 2017
;;==========================================
;;
;;== MELPA ==
(require 'package)
(add-to-list 'package-archives
             '("popkit" . "https://elpa.popkit.org/packages/"))
             ;; '("melpa" . "https://melpa.org/packages/"))
             ;; '("melpa" . "http://elpa.zilongshanren.com/melpa/"))
             ;; '("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)
;;
;;== Font ==
;; Setting English Font
(set-face-attribute
;; 'default nil :font "Source Code Pro for Powerline 10")
;; 'default nil :font "Fira Code 9")
;; 'default nil :font "Hack 10")
 'default nil :font "Iosevka 11")
;; Setting Chinese Font
(if (display-graphic-p)
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
			charset
			;;(font-spec :family "文泉驿等宽微米黑" :size 16))))
			(font-spec :family "方正楷体_GBK" :size 16))))
;;
;; Hello World!
;; 你好世界
;;
;;
;;== No Splash ==
(setq inhibit-startup-message t)
;;
;;== Color theme ==
(load-theme 'tango-dark t)
;; Load Day/Night theme based on time.
(setq hour_now (string-to-number (format-time-string "%H")))
(if (display-graphic-p)
    (load-theme (if (or (<= hour_now 6) (>= hour_now 19))
                    ;; 'misterioso 'tango)))
                    'spacemacs-dark 'spacemacs-light) t))
    ; 'spacemacs-dark 'spacemacs-dark) t))
    ;; (load-theme 'spacemacs-dark t))
;;
;;== Spaceline ==
(require 'spaceline-config)
(setq powerline-default-separator 'wave)
(spaceline-spacemacs-theme)
;;
;;== Enable column number ==
(column-number-mode t)
;;
;;== Enable line number ==
;; (global-linum-mode t)
;;
;;== Smooth scrolling ==
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time
;;
;; == Backup files folder ==
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(browse-url-firefox-program "dwb")
 '(custom-safe-themes
   (quote
    ("c7f838704d7caa88bc337464867c22af0a502e32154558b0f6c9c3c6e8650122" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   (quote
    (counsel swiper ivy highlight-indent-guides youdao-dictionary spaceline spacemacs-theme markdown-mode+ yasnippet websocket markdown-preview-eww markdown-mode flycheck company))))
;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/autosaves/" t)
;;
;;== No backup file ==
;;(setq make-backup-files nil)
;;
;;== Indentations ==
(setq-default indent-tabs-mode nil)
;;== Highlight-lindentatino-guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;; (setq highlight-indent-guides-method 'fill)
(setq highlight-indent-guides-method 'column)
;; (setq highlight-indent-guides-method 'character)
;;== Matching pairs of parentheses ==
(setq show-paren-delay 0)
(show-paren-mode 1)
(setq show-paren-style 'mixed)
;;
;;== Hide tool bar ==
(tool-bar-mode -1)
;;
;;== Proxy ==
;; (setq url-proxy-services '(("no_proxy" . "localhost")
;;                            ("no_proxy" . "*.youdao.com")
;;                            ("http" . "127.0.0.1:8087")
;;                            ("https" . "127.0.0.1:8087")))
;;
;;== Dispaly time ==
;;(display-time-mode t)
;;
;;== tab and ido-mode  ==
(setq-default indent-tabs-mode nil)
(setq-default tab-width 8)
(setq c-default-style "linux")
(setq c-basic-offset 8)
;; (ido-mode t)
;;
;; Ivy
(ivy-mode 1)
;;== Company-mode ==
(add-hook 'after-init-hook 'global-company-mode)
;;
;;== Enable auto fill mode ==
(setq auto-fill-mode nil)
;;
;;== Set the fill column(line wrap) ==
(setq fill-column 72)
;;
;;== Display pictures ==
(auto-image-file-mode)
;;
;;== Flycheck ==
(global-flycheck-mode)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
;;
;;== Shift-selection-mode ==
(setq shift-select-mode 'non-nil)
;;== Markdown ==
;;== Youdao Dictionary ==
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)
(global-set-key (kbd "C-c t") 'youdao-dictionary-play-voice-at-point)
(global-set-key (kbd "C-c C-y") 'youdao-dictionary-search-from-input)
;;
;;== EShell ==
(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))

(global-set-key (kbd "C-!") 'eshell-here)
;;
;;; .emacs ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
