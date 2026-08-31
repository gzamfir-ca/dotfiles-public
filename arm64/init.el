;;; init.el --- Configuration -*- lexical-binding: t; -*-
(setq warning-inhibit-types '((files missing-lexbind-cookie)))
(setq warning-suppress-types '((files missing-lexical-binding)))

;; Setup the package manager
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Refresh on new setup only
(unless package-archive-contents
  (package-refresh-contents))

(require 'use-package)
(setq use-package-always-ensure t)

;; Setup main visual outlook
(use-package desktop
             :ensure nil
             :config
             (desktop-save-mode 1)
             (setq desktop-save t)
             (add-to-list 'desktop-globals-to-save 'default-frame-alist))

(setq inhibit-startup-message t)
(global-display-line-numbers-mode t)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (select-frame frame)
            (tool-bar-mode -1)
            (set-scroll-bar-mode nil)))

(when (display-graphic-p)
  (tool-bar-mode -1)
  (set-scroll-bar-mode nil))

(when (eq system-type 'darwin)
  (set-face-attribute 'default nil
                      :family "Fira Code"
                      :height 130))

(global-hl-line-mode 1)
(setq-default indicate-empty-lines t)

;; Setup temp file locations
(setq make-backup-files t)
(setq backup-directory-alist
      '(("." . "~/.config/emacs/files/back/")))

(setq auto-save-default t)
(setq auto-save-file-name-transforms
      '((".*" "~/.config/emacs/files/swap/" t)))

(setq auto-save-interval 100)
(setq auto-save-timeout 2)

(use-package undohist
             :ensure t
             :config
             (setq undohist-directory "~/.config/emacs/files/undo/")
             (undohist-initialize))

;; Setup system key bindings
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (setq mac-right-option-modifier 'none)
  (setq mac-function-modifier 'hyper)

  (global-set-key (kbd "s-c") #'kill-ring-save)
  (global-set-key (kbd "s-v") #'yank)
  (global-set-key (kbd "s-x") #'kill-region)
  (global-set-key (kbd "s-z") #'undo)
  (global-set-key (kbd "s-s") #'save-buffer)
  (global-set-key (kbd "s-S") #'write-file)
  (global-set-key (kbd "s-a") #'mark-whole-buffer)
  (global-set-key (kbd "s-f") #'isearch-forward)
  (global-set-key (kbd "s-g") #'isearch-repeat-forward)
  (global-set-key (kbd "s-w") #'delete-frame)
  (global-set-key (kbd "s-q") #'save-buffers-kill-terminal)

  (global-set-key (kbd "s-=") #'text-scale-increase)
  (global-set-key (kbd "s--") #'text-scale-decrease))

;; Configure the color theme
(load-theme 'catppuccin :no-confirm)
(setq catppuccin-flavor 'macchiato)
(catppuccin-reload)

;; Setup CL & QL environment
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
(setq inferior-lisp-program "/opt/homebrew/bin/sbcl")
(setq split-width-threshold nil)
(setq split-height-threshold 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(catppuccin-theme undohist)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
