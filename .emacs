(setq inhibit-startup-message t) ; Avoid startup page and be redirected to scratch buffer

(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(menu-bar-mode -1) ; Disable menu bar
(cua-mode) ; Enable Copy/Cut and Pasting witch C-c,C-x & C-v

(global-set-key (kbd "<espace>") 'keyboard-escape-quit) ; Make ESC quit prompts

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode 1) (setq display-line-numbers 'relative)))

;; Disable lines numbers in terminal modes
(dolist (mode '(shell-mode-hook eshell-mode-hook)) (add-hook mode (lambda () (display-line-numbers-mode 0)))) 

(set-face-attribute 'default nil :font "Iosevka" :height 200) ; Setup font and font size
(setq custom-safe-themes t)
(load-theme 'doom-gruvbox) ; Setup theme

;; Initialize package sources repos
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("org" . "https://orgmode.org/elpa/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents (package-refresh-contents)) 
(unless (package-installed-p 'use-package) (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump t)
  (evil-mode 1))

; (evil-define-key 'normal global-map (kbd "SPC") "C-x") ; Supposed to replace CTRL with SPACE BUT DOESNT WORK
(evil-define-key 'insert global-map (kbd "SPC") 'self-insert-command)

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config (setq which-key-idle-delay 0.5))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui
  :commands lsp-ui-mode)

(use-package company
  :hook (after-init . global-company-mode))

(use-package cc-mode
  :ensure nil
  :mode ("\\.c\\`" "\\.h\\`" "\\.cpp\\`" "\\.hpp\\`" "\\.cc\\`" "\\.hh\\`"))

(use-package dap-mode)

(use-package doom-themes)
