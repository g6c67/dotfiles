;; Author: g6c67
;; Description: Init file.

;;;;;;;;;;;;;;
;; packages ;;
;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives '("melpa". "https://melpa.org/packages/"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Frames, windows, buffers ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Run fullscreen
;(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Change startup screen
;; WARNIN': this thing is not replicable, plugin in development
;; 1. Disable creation of splash-screen
;; 2. Open this file
;; 3. Switch to the buffer

(setq inhibit-startup-screen t)
(setq start-buffer (find-file "~/Documents/second-brain/projects.org"))
(switch-to-buffer start-buffer)

;;;;;;;;;;;;;;;;;;;;;;
;; custom variables ;;
;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 '(custom-safe-themes
   '("171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" "78e6be576f4a526d212d5f9a8798e5706990216e9be10174e3f3b015b8662e27" default))
 '(package-selected-packages
   '(atom-one-dark-theme tabbar session pod-mode muttrc-mode mutt-alias initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode company color-theme-modern browse-kill-ring boxquote bm bar-cursor apache-mode markdown-mode)))
(custom-set-faces
 )

;;;;;;;;;;;;;
;; Theming ;;
;;;;;;;;;;;;;

(load-theme 'adwaita-dark)
;;(set-frame-font "Inconsolata 12" nil t)

