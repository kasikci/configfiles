;; Emacs configuration file (.emacs)
;; author: kasikci

(add-to-list 'load-path "/home/kasikci/elisp/")
(load "/home/kasikci/elisp/tuareg-site-file.el")

;; Turn on flyspell in text mode
(add-hook 'text-mode-hook 'turn-on-flyspell)

;; auto refresh emacs buffers
(global-auto-revert-mode t)

(require 'ascii)

(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'xcscope)
(setq cscope-do-not-update-database t)
(setq cscope-use-face nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq column-number-mode t)
(show-paren-mode t)

;; enable line numbers by default
;; (global-linum-mode t)

;; change the default compile command to fit Portend's needs :-)
;; (setq compile-command "cd ../../ && make -j10")
(setq compile-command "cd /home/kasikci/cord/llvm-build && make -j8")

;; Portend debug mode
(make-face 'portend-debug-mode)
(set-face-attribute 'portend-debug-mode nil :underline t)
(set-face-attribute 'portend-debug-mode nil :foreground "yellow")
(set-face-attribute 'portend-debug-mode nil :family "times")
(set-face-attribute 'portend-debug-mode nil :slant 'normal)
(set-face-attribute 'portend-debug-mode nil :height '340)

;; (define-generic-mode portend-debug-mode
;;  nil
;;  nil
;;  '(("\\(^\\[.*Cloud9:\\|global.value\\)"
;;     (1 'portend-debug-mode)))
;;  nil
;;  nil)

;; (define-generic-mode portend-debug-mode
;;   nil
;;   nil 
;;   '(("\\([0-9]+/[0-9]+/[0-9]+\\)"
;;      (1 'portend-debug-mode)))
;;   nil
;;   nil)

(define-generic-mode portend-debug-mode
 nil
 nil
 '(("\\(^\\global.value\\)"
    (1 'portend-debug-mode)))
 nil
 nil)

;;open all .pdb files in portend debug mode
(setq auto-mode-alist (cons '("\\.pdb$" . portend-debug-mode) auto-mode-alist))

(global-set-key (kbd "<return>") 'newline)

;; easier window navigation with shift and arrow keys
;; (windmove-default-keybindings)

;; TODO: show line numbers in C++ mode

;; Set visual line mode when editing text to be able to wrap at word 
;; level and have navigation at visual lines level
(add-hook 'text-mode-hook 'visual-line-mode)

;;
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
