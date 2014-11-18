;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package management
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; list the packages you want
(setq package-list '(flyspell ))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;(require 'xcscope)
;(setq cscope-do-not-update-database t)
;(setq cscope-use-face nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editor settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Turn on flyspell in text mode
(add-hook 'text-mode-hook 'turn-on-flyspell)
;; Turn on flyspell's programming mode for programs
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;; auto refresh emacs buffers
(global-auto-revert-mode t)

;; tab-space-inlining settings
(setq-default indent-tabs-mode nil) ; make sure all indents use spaces, not tabs
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
(setq column-number-mode t)
(show-paren-mode t)

;; enable line numbers by default
;; TODO: show line numbers in C++ mode
(global-linum-mode t)

;; change the default compile command to fit my environment's needs :-)
;; (setq compile-command "cd ../../ && make -j10")
;; (setq compile-command "cd /home/kasikci/cord/llvm-build && make -j8")

;; Portend debug mode highlightings
;; (make-face 'portend-debug-mode)
;; (set-face-attribute 'portend-debug-mode nil :underline t)
;; (set-face-attribute 'portend-debug-mode nil :foreground "yellow")
;; (set-face-attribute 'portend-debug-mode nil :family "times")
;; (set-face-attribute 'portend-debug-mode nil :slant 'normal)
;; (set-face-attribute 'portend-debug-mode nil :height '340)

;;(define-generic-mode portend-debug-mode
;; nil
;; nil
;; '(("\\(^\\global.value\\)"
;;    (1 'portend-debug-mode)))
;; nil
;; nil)

;;open all .pdb files in portend debug mode
;;(setq auto-mode-alist (cons '("\\.pdb$" . portend-debug-mode) auto-mode-alist))

(global-set-key (kbd "<return>") 'newline)

;; Set visual line mode when editing text to be able to wrap at 
;; word level and have navigation at visual lines level
(add-hook 'text-mode-hook 'visual-line-mode)

;;
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))
