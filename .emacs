;; Place this file in C:\Users\Username\AppData\Roaming and point to the appropriate files
;(setq user-init-file "C:/src/dotfiles/.emacs")
;(setq user-emacs-directory "C:/src/dotfiles/.emacs.d/")
;(setq default-directory "C:/src/org/")
;(setenv "HOME" "C:/src/org/")
;(load user-init-file)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

;; Evil mode - modal text and hjkl goodness!
(require 'evil)
  (evil-mode 1)

;; HELM
(require 'helm-config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("c:/src/org")))
 '(package-selected-packages (quote (evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; org-agenda 4 common commands nice to have active 
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; org-agenda view with VIM up/down binding 
;; ERROR: ~symbol's value as variable is void org-agenda-mode-map~ 
;;(define-key org-agenda-mode-map "j" 'evil-next-line)
;;(define-key org-agenda-mode-map "k" 'evil-previous-line)

;; org todo logging date set when closed
(setq org-log-done 'time)
(setq org-log-done 'note)
