;; Place this file in C:\Users\Username\AppData\Roaming and point to the appropriate files
;(setq user-init-file "C:/src/dotfiles/.emacs")
;(setq user-emacs-directory "C:/src/dotfiles/.emacs.d/")
;(setq default-directory "C:/src/")
;(setenv "HOME" "C:/src/")
;(load user-init-file)
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
      (package-install 'use-package))

(eval-when-compile
    (require 'use-package))
(setq use-package-always-ensure t)

(use-package org)
(use-package evil)
(use-package helm)

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
 '(org-agenda-files (quote ("~/org"
			    "~/org/organization"
			    "~/org/projects")))
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

;; KEYWORDS for tasks
(setq org-todo-keywords
  (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
    (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

(setq org-todo-keyword-faces
  (quote (("TODO" :foreground "red" :weight bold)
    ("NEXT" :foreground "blue" :weight bold)
    ("DONE" :foreground "forest green" :weight bold)
    ("WAITING" :foreground "orange" :weight bold)
    ("HOLD" :foreground "magenta" :weight bold)
    ("CANCELLED" :foreground "forest green" :weight bold)
    ("MEETING" :foreground "forest green" :weight bold)
    ("PHONE" :foreground "forest green" :weight bold))))

;; Org-Mode CAPTURE
(setq org-directory "~/org")
(setq org-default-notes-file "~/org/refile.org")

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; CAPTURE templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
  (quote (("t" "todo" entry (file "~/org/refile.org") "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
          ("r" "respond" entry (file "~/org/refile.org") "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
          ("n" "note" entry (file "~/org/refile.org") "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "~/org/diary.org") "* %?\n%U\n" :clock-in t :clock-resume t)
          ("w" "org-protocol" entry (file "~/org/refile.org") "* TODO Review %c\n%U\n" :immediate-finish t)
          ("m" "Meeting" entry (file "~/org/refile.org") "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
          ("p" "Phone call" entry (file "~/org/refile.org") "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
          ("h" "Habit" entry (file "~/org/refile.org") "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))

;; REFILE
; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

; Use full outline paths for refile targets - we file directly with IDO
(setq org-refile-use-outline-path t)

; Targets complete directly with IDO
(setq org-outline-path-complete-in-steps nil)

; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes (quote confirm))
