(setq inhibit-startup-message t) ; Avoid startup page and be redirected to scratch buffer

(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
(menu-bar-mode -1) ; Disable menu bar
(cua-mode) ; Enable Copy/Cut and Pasting witch C-c,C-x & C-v

(global-set-key (kbd "<espace>") 'keyboard-escape-quit) ; Make ESC quit prompts
(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)
(set-face-attribute 'default nil :font "Iosevka" :height 200) ; Setup font and font size
(load-theme 'tango-dark) ; Setup theme

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
