(require 'package)

;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
;;(package-initialize)
;;(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; Global
(straight-use-package 'use-package)
(straight-use-package 'doom-modeline)
(straight-use-package 'yasnippet)
(straight-use-package 'all-the-icons)
(straight-use-package 'zenburn-theme)
(require 'doom-modeline)
(doom-modeline-mode 1)
(electric-pair-mode 1)
(load-theme 'zenburn t)

(straight-use-package 'lsp-mode)
(require 'lsp-mode)

;; default to mononoki
(set-face-attribute 'default nil
                    :family "Fira Code"
                    :height 120
                    :weight 'normal
                    :width  'normal)

;; (when (display-graphic-p)
;;   (require 'all-the-icons))

(setq column-number-mode t)
(setq line-number-mode t) 

(yas-reload-all)

(straight-use-package 'company)
(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
;; spellcheck
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; org mode
(straight-use-package 'org-mode)
(setq org-agenda-files (directory-files-recursively "~/Code/" "\\.org$"))
(setq org-todo-keywords
      '((sequence "NEXT" "TODO" "WAITING" "SOMEDAY" "VERIFY" "|" "DONE" "CANCELLED")))

;; Rust mode settings
(add-to-list 'exec-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin")
(straight-use-package 'rust-mode)
(require 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'lsp)

;; Coq
(straight-use-package 'proof-general)
(straight-use-package 'company-coq)
(straight-use-package 'pretty-mode)
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook #'prettify-symbols-mode)

;; agda
(setq auto-mode-alist
   (append
     '(("\\.agda\\'" . agda2-mode)
       ("\\.lagda.md\\'" . agda2-mode))
     auto-mode-alist))

;; fstar
(straight-use-package 'fstar-mode)

;; C

;; C++

;; Editor
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(safe-local-variable-values '((eval turn-off-auto-fill))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:slant normal :weight normal :height 140 :width normal)))))

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

(use-package ligature
  :load-path "./ligature.el/"
  :config
  ;; Enable the www ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))

  ;; Enable ligatures in programming modes                                                           
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                       ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                       "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                       "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                       "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                       "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                       "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                       "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                       "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                       "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

  (global-ligature-mode 't))
