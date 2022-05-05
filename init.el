(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-coq pretty-mode proof-general yasnippet-snippets yasnippet company markdown-preview-mode lsp-mode rust-mode doom-modeline))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; Global
(require 'doom-modeline)
(doom-modeline-mode 1)

(require 'lsp-mode)

(when (display-graphic-p)
  (require 'all-the-icons))

(setq column-number-mode t)
(setq line-number-mode t)

(yas-reload-all)

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Rust mode settings
(add-to-list 'exec-path "~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/bin")
(require 'rust-mode)
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'lsp)

;; Coq
(add-hook 'coq-mode-hook #'company-coq-mode)
(add-hook 'coq-mode-hook #'prettify-symbols-mode)

