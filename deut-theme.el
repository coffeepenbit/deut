;;; hc-zenburn-theme.el --- An higher contrast version of the Zenburn theme.

;; Copyright (C)2014 Nantas Nardelli

;; Author: Nantas Nardelli <nantas.nardelli@gmail.com>
;; URL: https:github.com/edran/hc-zenburn-emacs
;; Package-Version: 20150928.1633
;; Version 2.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; An higher contrast version of the Zenburn theme

;;; Credits:

;; Bozhidar Batsov <bozhidar@batsov.com> created the Zenburn theme
;; for emacs, which was a port of the vim theme made by Jani Nurminen.
;; His repository can be found at: https://github.com/bbatsov/zenburn-emacs


;;; Code:

(deftheme deut "An higher constrast Zenburn color theme")

;;; Color Palette

(defvar deut-colors-alist
  '(("deut-fg+1"     . "#FFFFEF")
    ("deut-fg"       . "#DCDCCC")
    ("deut-fg-1"     . "#70705E")
    ("deut-bg-2"     . "#000000")
    ("deut-bg-1"     . "#202020")
    ("deut-bg-05"    . "#2D2D2D")
    ("deut-bg"       . "#313131")
    ("deut-bg+05"    . "#383838")
    ("deut-bg+1"     . "#3E3E3E")
    ("deut-bg+2"     . "#4E4E4E")
    ("deut-bg+3"     . "#5E5E5E")
    ("deut-red+1"    . "#E9B0B0")
    ("deut-red"      . "#D9A0A0")
    ("deut-red-1"    . "#C99090")
    ("deut-red-2"    . "#B98080")
    ("deut-red-3"    . "#A97070")
    ("deut-red-4"    . "#996060")
    ("deut-orange"   . "#ECBC9C")
    ("deut-yellow"   . "#FDECBC")
    ("deut-yellow-1" . "#EDDCAC")
    ("deut-yellow-2" . "#DDCC9C")
    ("deut-green-1"  . "#6C8C6C")
    ("deut-green"    . "#8CAC8C")
    ("deut-green+1"  . "#9CBF9C")
    ("deut-green+2"  . "#ACD2AC")
    ("deut-green+3"  . "#BCE5BC")
    ("deut-green+4"  . "#CCF8CC")
    ("deut-cyan"     . "#A0EDF0")
    ("deut-blue+1"   . "#9CC7FB")
    ("deut-blue"     . "#99DDE0")
    ("deut-blue-1"   . "#89C5C8")
    ("deut-blue-2"   . "#79ADB0")
    ("deut-blue-3"   . "#699598")
    ("deut-blue-4"   . "#597D80")
    ("deut-blue-5"   . "#436D6D")
    ("deut-magenta"  . "#E090C7"))
  "List of Deut colors.
Each element has the form (NAME . HEX).

`+N' suffixes indicate a color is lighter.
`-N' suffixes indicate a color is darker.")

(defmacro deut-with-color-variables (&rest body)
  "`let' bind all colors defined in `deut-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   deut-colors-alist))
     ,@body))

;;; Theme Faces
(deut-with-color-variables
  (custom-theme-set-faces
   'deut
;;;; Built-in
;;;;; basic coloring
   '(button ((t (:underline t))))
   `(default ((t (:foreground ,deut-fg :background ,deut-bg))))
   `(link ((t (:foreground ,deut-yellow :underline t :weight bold))))
   `(link-visited ((t (:foreground ,deut-yellow-2 :underline t :weight normal))))
   `(default ((t (:foreground ,deut-fg :background ,deut-bg))))
   `(cursor ((t (:foreground ,deut-fg :background ,deut-fg+1))))
   `(escape-glyph ((t (:foreground ,deut-yellow :bold t))))
   `(fringe ((t (:foreground ,deut-fg :background ,deut-bg+1))))
   `(header-line ((t (:foreground ,deut-yellow
                                  :background ,deut-bg-1
                                  :box (:line-width -1 :style released-button)))))
   `(highlight ((t (:background ,deut-bg-05))))
   `(success ((t (:foreground ,deut-green :weight bold))))
   `(warning ((t (:foreground ,deut-orange :weight bold))))
;;;;; compilation
   `(compilation-column-face ((t (:foreground ,deut-yellow))))
   `(compilation-enter-directory-face ((t (:foreground ,deut-green))))
   `(compilation-error-face ((t (:foreground ,deut-red-1 :weight bold :underline t))))
   `(compilation-face ((t (:foreground ,deut-fg))))
   `(compilation-info-face ((t (:foreground ,deut-blue))))
   `(compilation-info ((t (:foreground ,deut-green+4 :underline t))))
   `(compilation-leave-directory-face ((t (:foreground ,deut-green))))
   `(compilation-line-face ((t (:foreground ,deut-yellow))))
   `(compilation-line-number ((t (:foreground ,deut-yellow))))
   `(compilation-message-face ((t (:foreground ,deut-blue))))
   `(compilation-warning-face ((t (:foreground ,deut-orange :weight bold :underline t))))
   `(compilation-mode-line-exit ((t (:foreground ,deut-green+2 :weight bold))))
   `(compilation-mode-line-fail ((t (:foreground ,deut-red :weight bold))))
   `(compilation-mode-line-run ((t (:foreground ,deut-yellow :weight bold))))
;;;;; grep
   `(grep-context-face ((t (:foreground ,deut-fg))))
   `(grep-error-face ((t (:foreground ,deut-red-1 :weight bold :underline t))))
   `(grep-hit-face ((t (:foreground ,deut-blue))))
   `(grep-match-face ((t (:foreground ,deut-orange :weight bold))))
   `(match ((t (:background ,deut-bg-1 :foreground ,deut-orange :weight bold))))
;;;;; neotree
   `(neo-file-link-face ((t (:background ,deut-bg :foreground ,deut-fg))))
   `(neo-root-dir-face ((t (:foreground ,deut-blue :weight bold))))
   `(neo-dir-link-face ((t (:foreground ,deut-green+1))))
;;;;; isearch
   `(isearch ((t (:foreground ,deut-yellow-2 :weight bold :background ,deut-bg+2))))
   `(isearch-fail ((t (:foreground ,deut-fg :background ,deut-red-4))))
   `(lazy-highlight ((t (:foreground ,deut-yellow-2 :weight bold :background ,deut-bg-05))))

   `(menu ((t (:foreground ,deut-fg :background ,deut-bg))))
   `(minibuffer-prompt ((t (:foreground ,deut-yellow))))
   `(mode-line
     ((,class (:foreground ,deut-green+1
                           :background ,deut-bg-1
                           :box (:line-width -1 :style released-button)))
      (t :inverse-video t)))
   `(mode-line-buffer-id ((t (:foreground ,deut-yellow :weight bold))))
   `(mode-line-inactive
     ((t (:foreground ,deut-green-1
                      :background ,deut-bg-05
                      :box (:line-width -1 :style released-button)))))
   `(region ((,class (:background ,deut-bg-1))
             (t :inverse-video t)))
   `(secondary-selection ((t (:background ,deut-bg+2))))
   `(trailing-whitespace ((t (:background ,deut-red))))
   `(vertical-border ((t (:foreground ,deut-fg))))
;;;;; font lock
   `(font-lock-builtin-face ((t (:foreground ,deut-fg :weight bold))))
   `(font-lock-comment-face ((t (:foreground ,deut-green))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,deut-green-1))))
   `(font-lock-constant-face ((t (:foreground ,deut-green+4))))
   `(font-lock-doc-face ((t (:foreground ,deut-green+2))))
   `(font-lock-function-name-face ((t (:foreground ,deut-cyan))))
   `(font-lock-keyword-face ((t (:foreground ,deut-yellow :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,deut-yellow :weight bold))))
   `(font-lock-preprocessor-face ((t (:foreground ,deut-blue+1))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,deut-yellow :weight bold))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,deut-green :weight bold))))
   `(font-lock-string-face ((t (:foreground ,deut-red))))
   `(font-lock-type-face ((t (:foreground ,deut-blue-1))))
   `(font-lock-variable-name-face ((t (:foreground ,deut-orange))))
   `(font-lock-warning-face ((t (:foreground ,deut-yellow-2 :weight bold))))

   `(c-annotation-face ((t (:inherit font-lock-constant-face))))
;;;;; newsticker
   `(newsticker-date-face ((t (:foreground ,deut-fg))))
   `(newsticker-default-face ((t (:foreground ,deut-fg))))
   `(newsticker-enclosure-face ((t (:foreground ,deut-green+3))))
   `(newsticker-extra-face ((t (:foreground ,deut-bg+2 :height 0.8))))
   `(newsticker-feed-face ((t (:foreground ,deut-fg))))
   `(newsticker-immortal-item-face ((t (:foreground ,deut-green))))
   `(newsticker-new-item-face ((t (:foreground ,deut-blue))))
   `(newsticker-obsolete-item-face ((t (:foreground ,deut-red))))
   `(newsticker-old-item-face ((t (:foreground ,deut-bg+3))))
   `(newsticker-statistics-face ((t (:foreground ,deut-fg))))
   `(newsticker-treeview-face ((t (:foreground ,deut-fg))))
   `(newsticker-treeview-immortal-face ((t (:foreground ,deut-green))))
   `(newsticker-treeview-listwindow-face ((t (:foreground ,deut-fg))))
   `(newsticker-treeview-new-face ((t (:foreground ,deut-blue :weight bold))))
   `(newsticker-treeview-obsolete-face ((t (:foreground ,deut-red))))
   `(newsticker-treeview-old-face ((t (:foreground ,deut-bg+3))))
   `(newsticker-treeview-selection-face ((t (:background ,deut-bg-1 :foreground ,deut-yellow))))
;;;; Third-party
;;;;; ace-jump
   `(ace-jump-face-background
     ((t (:foreground ,deut-fg-1 :background ,deut-bg :inverse-video nil))))
   `(ace-jump-face-foreground
     ((t (:foreground ,deut-green+2 :background ,deut-bg :inverse-video nil))))
;;;;; android mode
   `(android-mode-debug-face ((t (:foreground ,deut-green+1))))
   `(android-mode-error-face ((t (:foreground ,deut-orange :weight bold))))
   `(android-mode-info-face ((t (:foreground ,deut-fg))))
   `(android-mode-verbose-face ((t (:foreground ,deut-green))))
   `(android-mode-warning-face ((t (:foreground ,deut-yellow))))
;;;;; anzu
   `(anzu-mode-line ((t (:foreground ,deut-cyan :weight bold))))
;;;;; auctex
   `(font-latex-bold-face ((t (:inherit bold))))
   `(font-latex-warning-face ((t (:foreground nil :inherit font-lock-warning-face))))
   `(font-latex-sectioning-5-face ((t (:foreground ,deut-red :weight bold ))))
   `(font-latex-sedate-face ((t (:foreground ,deut-yellow))))
   `(font-latex-italic-face ((t (:foreground ,deut-cyan :slant italic))))
   `(font-latex-string-face ((t (:inherit ,font-lock-string-face))))
   `(font-latex-math-face ((t (:foreground ,deut-orange))))
;;;;; auto-complete
   `(ac-candidate-face ((t (:background ,deut-bg+3 :foreground ,deut-bg-2))))
   `(ac-selection-face ((t (:background ,deut-blue-4 :foreground ,deut-fg))))
   `(popup-tip-face ((t (:background ,deut-yellow-2 :foreground ,deut-bg-2))))
   `(popup-scroll-bar-foreground-face ((t (:background ,deut-blue-5))))
   `(popup-scroll-bar-background-face ((t (:background ,deut-bg-1))))
   `(popup-isearch-match ((t (:background ,deut-bg :foreground ,deut-fg))))
;;;;; company-mode
   `(company-tooltip ((t (:foreground ,deut-fg :background ,deut-bg+1))))
   `(company-tooltip-annotation ((t (:foreground ,deut-orange :background ,deut-bg+1))))
   `(company-tooltip-selection ((t (:foreground ,deut-fg :background ,deut-bg-1))))
   `(company-tooltip-mouse ((t (:background ,deut-bg-1))))
   `(company-tooltip-common ((t (:foreground ,deut-green+2))))
   `(company-tooltip-common-selection ((t (:foreground ,deut-green+2))))
   `(company-scrollbar-fg ((t (:background ,deut-bg-1))))
   `(company-scrollbar-bg ((t (:background ,deut-bg+2))))
   `(company-preview ((t (:background ,deut-green+2))))
   `(company-preview-common ((t (:foreground ,deut-green+2 :background ,deut-bg-1))))
;;;;; bm
   `(bm-face ((t (:background ,deut-yellow-1 :foreground ,deut-bg))))
   `(bm-fringe-face ((t (:background ,deut-yellow-1 :foreground ,deut-bg))))
   `(bm-fringe-persistent-face ((t (:background ,deut-green-1 :foreground ,deut-bg))))
   `(bm-persistent-face ((t (:background ,deut-green-1 :foreground ,deut-bg))))
;;;;; clojure-test-mode
   `(clojure-test-failure-face ((t (:foreground ,deut-orange :weight bold :underline t))))
   `(clojure-test-error-face ((t (:foreground ,deut-red :weight bold :underline t))))
   `(clojure-test-success-face ((t (:foreground ,deut-green+1 :weight bold :underline t))))
;;;;; coq
   `(coq-solve-tactics-face ((t (:foreground nil :inherit font-lock-constant-face))))
;;;;; ctable
   `(ctbl:face-cell-select ((t (:background ,deut-blue :foreground ,deut-bg))))
   `(ctbl:face-continue-bar ((t (:background ,deut-bg-05 :foreground ,deut-bg))))
   `(ctbl:face-row-select ((t (:background ,deut-cyan :foreground ,deut-bg))))
;;;;; diff
   `(diff-added ((,class (:foreground ,deut-green+4 :background nil))
                 (t (:foreground ,deut-green-1 :background nil))))
   `(diff-changed ((t (:foreground ,deut-yellow))))
   `(diff-removed ((,class (:foreground ,deut-red :background nil))
                   (t (:foreground ,deut-red-3 :background nil))))
   `(diff-refine-added ((t (:inherit diff-added :weight bold))))
   `(diff-refine-change ((t (:inherit diff-changed :weight bold))))
   `(diff-refine-removed ((t (:inherit diff-removed :weight bold))))
   `(diff-header ((,class (:background ,deut-bg+2))
                  (t (:background ,deut-fg :foreground ,deut-bg))))
   `(diff-file-header
     ((,class (:background ,deut-bg+2 :foreground ,deut-fg :bold t))
      (t (:background ,deut-fg :foreground ,deut-bg :bold t))))
;;;;; diff-hl
   `(diff-hl-change ((,class (:foreground ,deut-blue-2 :background ,deut-bg-05))))
   `(diff-hl-delete ((,class (:foreground ,deut-red+1 :background ,deut-bg-05))))
   `(diff-hl-insert ((,class (:foreground ,deut-green+1 :background ,deut-bg-05))))
   `(diff-hl-unknown ((,class (:foreground ,deut-yellow :background ,deut-bg-05))))
;;;;; dim-autoload
   `(dim-autoload-cookie-line ((t :foreground ,deut-bg+1)))
;;;;; dired+
   `(diredp-display-msg ((t (:foreground ,deut-blue))))
   `(diredp-compressed-file-suffix ((t (:foreground ,deut-orange))))
   `(diredp-date-time ((t (:foreground ,deut-magenta))))
   `(diredp-deletion ((t (:foreground ,deut-yellow))))
   `(diredp-deletion-file-name ((t (:foreground ,deut-red))))
   `(diredp-dir-heading ((t (:foreground ,deut-blue :background ,deut-bg-1))))
   `(diredp-dir-priv ((t (:foreground ,deut-cyan))))
   `(diredp-exec-priv ((t (:foreground ,deut-red))))
   `(diredp-executable-tag ((t (:foreground ,deut-green+1))))
   `(diredp-file-name ((t (:foreground ,deut-blue))))
   `(diredp-file-suffix ((t (:foreground ,deut-green))))
   `(diredp-flag-mark ((t (:foreground ,deut-yellow))))
   `(diredp-flag-mark-line ((t (:foreground ,deut-orange))))
   `(diredp-ignored-file-name ((t (:foreground ,deut-red))))
   `(diredp-link-priv ((t (:foreground ,deut-yellow))))
   `(diredp-mode-line-flagged ((t (:foreground ,deut-yellow))))
   `(diredp-mode-line-marked ((t (:foreground ,deut-orange))))
   `(diredp-no-priv ((t (:foreground ,deut-fg))))
   `(diredp-number ((t (:foreground ,deut-green+1))))
   `(diredp-other-priv ((t (:foreground ,deut-yellow-1))))
   `(diredp-rare-priv ((t (:foreground ,deut-red-1))))
   `(diredp-read-priv ((t (:foreground ,deut-green-1))))
   `(diredp-symlink ((t (:foreground ,deut-yellow))))
   `(diredp-write-priv ((t (:foreground ,deut-magenta))))
;;;;; ediff
   `(ediff-current-diff-A ((t (:foreground ,deut-fg :background ,deut-red-4))))
   `(ediff-current-diff-Ancestor ((t (:foreground ,deut-fg :background ,deut-red-4))))
   `(ediff-current-diff-B ((t (:foreground ,deut-fg :background ,deut-green-1))))
   `(ediff-current-diff-C ((t (:foreground ,deut-fg :background ,deut-blue-5))))
   `(ediff-even-diff-A ((t (:background ,deut-bg+1))))
   `(ediff-even-diff-Ancestor ((t (:background ,deut-bg+1))))
   `(ediff-even-diff-B ((t (:background ,deut-bg+1))))
   `(ediff-even-diff-C ((t (:background ,deut-bg+1))))
   `(ediff-fine-diff-A ((t (:foreground ,deut-fg :background ,deut-red-2 :weight bold))))
   `(ediff-fine-diff-Ancestor ((t (:foreground ,deut-fg :background ,deut-red-2 weight bold))))
   `(ediff-fine-diff-B ((t (:foreground ,deut-fg :background ,deut-green :weight bold))))
   `(ediff-fine-diff-C ((t (:foreground ,deut-fg :background ,deut-blue-3 :weight bold ))))
   `(ediff-odd-diff-A ((t (:background ,deut-bg+2))))
   `(ediff-odd-diff-Ancestor ((t (:background ,deut-bg+2))))
   `(ediff-odd-diff-B ((t (:background ,deut-bg+2))))
   `(ediff-odd-diff-C ((t (:background ,deut-bg+2))))
;;;;; egg
   `(egg-text-base ((t (:foreground ,deut-fg))))
   `(egg-help-header-1 ((t (:foreground ,deut-yellow))))
   `(egg-help-header-2 ((t (:foreground ,deut-green+3))))
   `(egg-branch ((t (:foreground ,deut-yellow))))
   `(egg-branch-mono ((t (:foreground ,deut-yellow))))
   `(egg-term ((t (:foreground ,deut-yellow))))
   `(egg-diff-add ((t (:foreground ,deut-green+4))))
   `(egg-diff-del ((t (:foreground ,deut-red+1))))
   `(egg-diff-file-header ((t (:foreground ,deut-yellow-2))))
   `(egg-section-title ((t (:foreground ,deut-yellow))))
   `(egg-stash-mono ((t (:foreground ,deut-green+4))))
;;;;; elfeed
   `(elfeed-search-date-face ((t (:foreground ,deut-yellow-1 :underline t
                                              :weight bold))))
   `(elfeed-search-tag-face ((t (:foreground ,deut-green))))
   `(elfeed-search-feed-face ((t (:foreground ,deut-cyan))))
;;;;; emacs-w3m
   `(w3m-anchor ((t (:foreground ,deut-yellow :underline t
                                 :weight bold))))
   `(w3m-arrived-anchor ((t (:foreground ,deut-yellow-2
                                         :underline t :weight normal))))
   `(w3m-form ((t (:foreground ,deut-red-1 :underline t))))
   `(w3m-header-line-location-title ((t (:foreground ,deut-yellow
                                                     :underline t :weight bold))))
   '(w3m-history-current-url ((t (:inherit match))))
   `(w3m-lnum ((t (:foreground ,deut-green+2 :background ,deut-bg))))
   `(w3m-lnum-match ((t (:background ,deut-bg-1
                                     :foreground ,deut-orange
                                     :weight bold))))
   `(w3m-lnum-minibuffer-prompt ((t (:foreground ,deut-yellow))))
;;;;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:foreground ,deut-blue :weight bold))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-default-face ((t (:foreground ,deut-fg))))
   `(erc-direct-msg-face ((t (:inherit erc-default))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit erc-default))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-input-face ((t (:foreground ,deut-yellow))))
   `(erc-keyword-face ((t (:foreground ,deut-blue :weight bold))))
   `(erc-nick-default-face ((t (:foreground ,deut-yellow :weight bold))))
   `(erc-my-nick-face ((t (:foreground ,deut-red :weight bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default))))
   `(erc-notice-face ((t (:foreground ,deut-green))))
   `(erc-pal-face ((t (:foreground ,deut-orange :weight bold))))
   `(erc-prompt-face ((t (:foreground ,deut-orange :background ,deut-bg :weight bold))))
   `(erc-timestamp-face ((t (:foreground ,deut-green+4))))
   `(erc-underline-face ((t (:underline t))))
;;;;; ert
   `(ert-test-result-expected ((t (:foreground ,deut-green+4 :background ,deut-bg))))
   `(ert-test-result-unexpected ((t (:foreground ,deut-red :background ,deut-bg))))
;;;;; eshell
   `(eshell-prompt ((t (:foreground ,deut-yellow :weight bold))))
   `(eshell-ls-archive ((t (:foreground ,deut-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,deut-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,deut-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,deut-fg))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:foreground ,deut-yellow :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,deut-cyan :weight bold))))
;;;;; flx
   `(flx-highlight-face ((t (:foreground ,deut-green+2 :weight bold))))
;;;;; flycheck
   `(flycheck-error
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-red-1) :inherit unspecified))
      (t (:foreground ,deut-red-1 :weight bold :underline t))))
   `(flycheck-warning
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-yellow) :inherit unspecified))
      (t (:foreground ,deut-yellow :weight bold :underline t))))
   `(flycheck-info
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-cyan) :inherit unspecified))
      (t (:foreground ,deut-cyan :weight bold :underline t))))
   `(flycheck-fringe-error ((t (:foreground ,deut-red-1 :weight bold))))
   `(flycheck-fringe-warning ((t (:foreground ,deut-yellow :weight bold))))
   `(flycheck-fringe-info ((t (:foreground ,deut-cyan :weight bold))))
;;;;; flymake
   `(flymake-errline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-red)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,deut-red-1 :weight bold :underline t))))
   `(flymake-warnline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-orange)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,deut-orange :weight bold :underline t))))
   `(flymake-infoline
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-green)
                   :inherit unspecified :foreground unspecified :background unspecified))
      (t (:foreground ,deut-green-1 :weight bold :underline t))))
;;;;; flyspell
   `(flyspell-duplicate
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-orange) :inherit unspecified))
      (t (:foreground ,deut-orange :weight bold :underline t))))
   `(flyspell-incorrect
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-red) :inherit unspecified))
      (t (:foreground ,deut-red-1 :weight bold :underline t))))
;;;;; full-ack
   `(ack-separator ((t (:foreground ,deut-fg))))
   `(ack-file ((t (:foreground ,deut-blue))))
   `(ack-line ((t (:foreground ,deut-yellow))))
   `(ack-match ((t (:foreground ,deut-orange :background ,deut-bg-1 :weight bold))))
;;;;; git-gutter
   `(git-gutter:added ((t (:foreground ,deut-green :weight bold :inverse-video t))))
   `(git-gutter:deleted ((t (:foreground ,deut-red :weight bold :inverse-video t))))
   `(git-gutter:modified ((t (:foreground ,deut-magenta :weight bold :inverse-video t))))
   `(git-gutter:unchanged ((t (:foreground ,deut-fg :weight bold :inverse-video t))))
;;;;; git-gutter-fr
   `(git-gutter-fr:added ((t (:foreground ,deut-green  :weight bold))))
   `(git-gutter-fr:deleted ((t (:foreground ,deut-red :weight bold))))
   `(git-gutter-fr:modified ((t (:foreground ,deut-magenta :weight bold))))
;;;;; git-rebase-mode
   `(git-rebase-hash ((t (:foreground, deut-orange))))
;;;;; gnus
   `(gnus-group-mail-1 ((t (:bold t :inherit gnus-group-mail-1-empty))))
   `(gnus-group-mail-1-empty ((t (:inherit gnus-group-news-1-empty))))
   `(gnus-group-mail-2 ((t (:bold t :inherit gnus-group-mail-2-empty))))
   `(gnus-group-mail-2-empty ((t (:inherit gnus-group-news-2-empty))))
   `(gnus-group-mail-3 ((t (:bold t :inherit gnus-group-mail-3-empty))))
   `(gnus-group-mail-3-empty ((t (:inherit gnus-group-news-3-empty))))
   `(gnus-group-mail-4 ((t (:bold t :inherit gnus-group-mail-4-empty))))
   `(gnus-group-mail-4-empty ((t (:inherit gnus-group-news-4-empty))))
   `(gnus-group-mail-5 ((t (:bold t :inherit gnus-group-mail-5-empty))))
   `(gnus-group-mail-5-empty ((t (:inherit gnus-group-news-5-empty))))
   `(gnus-group-mail-6 ((t (:bold t :inherit gnus-group-mail-6-empty))))
   `(gnus-group-mail-6-empty ((t (:inherit gnus-group-news-6-empty))))
   `(gnus-group-mail-low ((t (:bold t :inherit gnus-group-mail-low-empty))))
   `(gnus-group-mail-low-empty ((t (:inherit gnus-group-news-low-empty))))
   `(gnus-group-news-1 ((t (:bold t :inherit gnus-group-news-1-empty))))
   `(gnus-group-news-2 ((t (:bold t :inherit gnus-group-news-2-empty))))
   `(gnus-group-news-3 ((t (:bold t :inherit gnus-group-news-3-empty))))
   `(gnus-group-news-4 ((t (:bold t :inherit gnus-group-news-4-empty))))
   `(gnus-group-news-5 ((t (:bold t :inherit gnus-group-news-5-empty))))
   `(gnus-group-news-6 ((t (:bold t :inherit gnus-group-news-6-empty))))
   `(gnus-group-news-low ((t (:bold t :inherit gnus-group-news-low-empty))))
   `(gnus-header-content ((t (:inherit message-header-other))))
   `(gnus-header-from ((t (:inherit message-header-from))))
   `(gnus-header-name ((t (:inherit message-header-name))))
   `(gnus-header-newsgroups ((t (:inherit message-header-other))))
   `(gnus-header-subject ((t (:inherit message-header-subject))))
   `(gnus-summary-cancelled ((t (:foreground ,deut-orange))))
   `(gnus-summary-high-ancient ((t (:foreground ,deut-blue))))
   `(gnus-summary-high-read ((t (:foreground ,deut-green :weight bold))))
   `(gnus-summary-high-ticked ((t (:foreground ,deut-orange :weight bold))))
   `(gnus-summary-high-unread ((t (:foreground ,deut-fg :weight bold))))
   `(gnus-summary-low-ancient ((t (:foreground ,deut-blue))))
   `(gnus-summary-low-read ((t (:foreground ,deut-green))))
   `(gnus-summary-low-ticked ((t (:foreground ,deut-orange :weight bold))))
   `(gnus-summary-low-unread ((t (:foreground ,deut-fg))))
   `(gnus-summary-normal-ancient ((t (:foreground ,deut-blue))))
   `(gnus-summary-normal-read ((t (:foreground ,deut-green))))
   `(gnus-summary-normal-ticked ((t (:foreground ,deut-orange :weight bold))))
   `(gnus-summary-normal-unread ((t (:foreground ,deut-fg))))
   `(gnus-summary-selected ((t (:foreground ,deut-yellow :weight bold))))
   `(gnus-cite-1 ((t (:foreground ,deut-blue))))
   `(gnus-cite-10 ((t (:foreground ,deut-yellow-1))))
   `(gnus-cite-11 ((t (:foreground ,deut-yellow))))
   `(gnus-cite-2 ((t (:foreground ,deut-blue-1))))
   `(gnus-cite-3 ((t (:foreground ,deut-blue-2))))
   `(gnus-cite-4 ((t (:foreground ,deut-green+2))))
   `(gnus-cite-5 ((t (:foreground ,deut-green+1))))
   `(gnus-cite-6 ((t (:foreground ,deut-green))))
   `(gnus-cite-7 ((t (:foreground ,deut-red))))
   `(gnus-cite-8 ((t (:foreground ,deut-red-1))))
   `(gnus-cite-9 ((t (:foreground ,deut-red-2))))
   `(gnus-group-news-1-empty ((t (:foreground ,deut-yellow))))
   `(gnus-group-news-2-empty ((t (:foreground ,deut-green+3))))
   `(gnus-group-news-3-empty ((t (:foreground ,deut-green+1))))
   `(gnus-group-news-4-empty ((t (:foreground ,deut-blue-2))))
   `(gnus-group-news-5-empty ((t (:foreground ,deut-blue-3))))
   `(gnus-group-news-6-empty ((t (:foreground ,deut-bg+2))))
   `(gnus-group-news-low-empty ((t (:foreground ,deut-bg+2))))
   `(gnus-signature ((t (:foreground ,deut-yellow))))
   `(gnus-x ((t (:background ,deut-fg :foreground ,deut-bg))))
;;;;; guide-key
   `(guide-key/highlight-command-face ((t (:foreground ,deut-blue))))
   `(guide-key/key-face ((t (:foreground ,deut-green))))
   `(guide-key/prefix-command-face ((t (:foreground ,deut-green+1))))
;;;;; helm
   `(helm-header
     ((t (:foreground ,deut-green
                      :background ,deut-bg
                      :underline nil
                      :box nil))))
   `(helm-source-header
     ((t (:foreground ,deut-yellow
                      :background ,deut-bg-1
                      :underline nil
                      :weight bold
                      :box (:line-width -1 :style released-button)))))
   `(helm-selection ((t (:background ,deut-bg+1 :underline nil))))
   `(helm-selection-line ((t (:background ,deut-bg+1))))
   `(helm-visible-mark ((t (:foreground ,deut-bg :background ,deut-yellow-2))))
   `(helm-candidate-number ((t (:foreground ,deut-green+4 :background ,deut-bg-1))))
   `(helm-separator ((t (:foreground ,deut-red :background ,deut-bg))))
   `(helm-time-zone-current ((t (:foreground ,deut-green+2 :background ,deut-bg))))
   `(helm-time-zone-home ((t (:foreground ,deut-red :background ,deut-bg))))
   `(helm-bookmark-addressbook ((t (:foreground ,deut-orange :background ,deut-bg))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,deut-magenta :background ,deut-bg))))
   `(helm-bookmark-info ((t (:foreground ,deut-green+2 :background ,deut-bg))))
   `(helm-bookmark-man ((t (:foreground ,deut-yellow :background ,deut-bg))))
   `(helm-bookmark-w3m ((t (:foreground ,deut-magenta :background ,deut-bg))))
   `(helm-buffer-not-saved ((t (:foreground ,deut-red :background ,deut-bg))))
   `(helm-buffer-process ((t (:foreground ,deut-cyan :background ,deut-bg))))
   `(helm-buffer-saved-out ((t (:foreground ,deut-fg :background ,deut-bg))))
   `(helm-buffer-size ((t (:foreground ,deut-fg-1 :background ,deut-bg))))
   `(helm-ff-directory ((t (:foreground ,deut-cyan :background ,deut-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,deut-fg :background ,deut-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,deut-green+2 :background ,deut-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,deut-red :background ,deut-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,deut-yellow :background ,deut-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,deut-bg :background ,deut-yellow :weight normal))))
   `(helm-grep-cmd-line ((t (:foreground ,deut-cyan :background ,deut-bg))))
   `(helm-grep-file ((t (:foreground ,deut-fg :background ,deut-bg))))
   `(helm-grep-finish ((t (:foreground ,deut-green+2 :background ,deut-bg))))
   `(helm-grep-lineno ((t (:foreground ,deut-fg-1 :background ,deut-bg))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-grep-running ((t (:foreground ,deut-red :background ,deut-bg))))
   `(helm-moccur-buffer ((t (:foreground ,deut-cyan :background ,deut-bg))))
   `(helm-mu-contacts-address-face ((t (:foreground ,deut-fg-1 :background ,deut-bg))))
   `(helm-mu-contacts-name-face ((t (:foreground ,deut-fg :background ,deut-bg))))
;;;;; hl-line-mode
   `(hl-line-face ((,class (:background ,deut-bg-05))
                   (t :weight bold)))
   `(hl-line ((,class (:background ,deut-bg-05)) ; old emacsen
              (t :weight bold)))
;;;;; hl-sexp
   `(hl-sexp-face ((,class (:background ,deut-bg+1))
                   (t :weight bold)))
;;;;; ido-mode
   `(ido-first-match ((t (:foreground ,deut-yellow :weight bold))))
   `(ido-only-match ((t (:foreground ,deut-orange :weight bold))))
   `(ido-subdir ((t (:foreground ,deut-yellow))))
   `(ido-indicator ((t (:foreground ,deut-yellow :background ,deut-red-4))))
;;;;; iedit-mode
   `(iedit-occurrence ((t (:background ,deut-bg+2 :weight bold))))
;;;;; jabber-mode
   `(jabber-roster-user-away ((t (:foreground ,deut-green+2))))
   `(jabber-roster-user-online ((t (:foreground ,deut-blue-1))))
   `(jabber-roster-user-dnd ((t (:foreground ,deut-red+1))))
   `(jabber-rare-time-face ((t (:foreground ,deut-green+1))))
   `(jabber-chat-prompt-local ((t (:foreground ,deut-blue-1))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,deut-red+1))))
   `(jabber-activity-face((t (:foreground ,deut-red+1))))
   `(jabber-activity-personal-face ((t (:foreground ,deut-blue+1))))
   `(jabber-title-small ((t (:height 1.1 :weight bold))))
   `(jabber-title-medium ((t (:height 1.2 :weight bold))))
   `(jabber-title-large ((t (:height 1.3 :weight bold))))
;;;;; js2-mode
   `(js2-warning ((t (:underline ,deut-orange))))
   `(js2-error ((t (:foreground ,deut-red :weight bold))))
   `(js2-jsdoc-tag ((t (:foreground ,deut-green-1))))
   `(js2-jsdoc-type ((t (:foreground ,deut-green+2))))
   `(js2-jsdoc-value ((t (:foreground ,deut-green+3))))
   `(js2-function-param ((t (:foreground, deut-green+3))))
   `(js2-external-variable ((t (:foreground ,deut-orange))))
;;;;; ledger-mode
   `(ledger-font-payee-uncleared-face ((t (:foreground ,deut-red-1 :weight bold))))
   `(ledger-font-payee-cleared-face ((t (:foreground ,deut-fg :weight normal))))
   `(ledger-font-xact-highlight-face ((t (:background ,deut-bg+1))))
   `(ledger-font-pending-face ((t (:foreground ,deut-orange weight: normal))))
   `(ledger-font-other-face ((t (:foreground ,deut-fg))))
   `(ledger-font-posting-account-face ((t (:foreground ,deut-blue-1))))
   `(ledger-font-posting-account-cleared-face ((t (:foreground ,deut-fg))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,deut-orange))))
   `(ledger-font-posting-amount-face ((t (:foreground ,deut-orange))))
   `(ledger-font-posting-account-pending-face ((t (:foreground ,deut-orange))))
   `(ledger-occur-narrowed-face ((t (:foreground ,deut-fg-1 :invisible t))))
   `(ledger-occur-xact-face ((t (:background ,deut-bg+1))))
   `(ledger-font-comment-face ((t (:foreground ,deut-green))))
   `(ledger-font-reconciler-uncleared-face ((t (:foreground ,deut-red-1 :weight bold))))
   `(ledger-font-reconciler-cleared-face ((t (:foreground ,deut-fg :weight normal))))
   `(ledger-font-reconciler-pending-face ((t (:foreground ,deut-orange :weight normal))))
   `(ledger-font-report-clickable-face ((t (:foreground ,deut-orange :weight normal))))
;;;;; linum-mode
   `(linum ((t (:foreground ,deut-green+2 :background ,deut-bg))))
;;;;; lui
   `(lui-time-stamp-face ((t (:foreground ,deut-blue-1))))
   `(lui-hilight-face ((t (:foreground ,deut-green+2 :background ,deut-bg))))
   `(lui-button-face ((t (:inherit hover-highlight))))
;;;;; macrostep
   `(macrostep-gensym-1
     ((t (:foreground ,deut-green+2 :background ,deut-bg-1))))
   `(macrostep-gensym-2
     ((t (:foreground ,deut-red+1 :background ,deut-bg-1))))
   `(macrostep-gensym-3
     ((t (:foreground ,deut-blue+1 :background ,deut-bg-1))))
   `(macrostep-gensym-4
     ((t (:foreground ,deut-magenta :background ,deut-bg-1))))
   `(macrostep-gensym-5
     ((t (:foreground ,deut-yellow :background ,deut-bg-1))))
   `(macrostep-expansion-highlight-face
     ((t (:inherit highlight))))
   `(macrostep-macro-face
     ((t (:underline t))))
;;;;; magit
;;;;;; headings and diffs
   `(magit-section-highlight           ((t (:background ,deut-bg+05))))
   `(magit-section-heading             ((t (:foreground ,deut-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,deut-orange :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,deut-bg+05  :weight bold))))
   `(magit-diff-file-heading-selection ((t (:background ,deut-bg+05
                                            :foreground ,deut-orange :weight bold))))
   `(magit-diff-hunk-heading           ((t (:background ,deut-bg+1))))
   `(magit-diff-hunk-heading-highlight ((t (:background ,deut-bg+2))))
   `(magit-diff-hunk-heading-selection ((t (:background ,deut-bg+2
                                            :foreground ,deut-orange))))
   `(magit-diff-lines-heading          ((t (:background ,deut-orange
                                            :foreground ,deut-bg+2))))
   `(magit-diff-context-highlight      ((t (:background ,deut-bg+05
                                            :foreground "grey70"))))
   `(magit-diffstat-added   ((t (:foreground ,deut-green+4))))
   `(magit-diffstat-removed ((t (:foreground ,deut-red))))
;;;;;; popup
   `(magit-popup-heading             ((t (:foreground ,deut-yellow  :weight bold))))
   `(magit-popup-key                 ((t (:foreground ,deut-green-1 :weight bold))))
   `(magit-popup-argument            ((t (:foreground ,deut-green   :weight bold))))
   `(magit-popup-disabled-argument   ((t (:foreground ,deut-fg-1    :weight normal))))
   `(magit-popup-option-value        ((t (:foreground ,deut-blue-2  :weight bold))))
;;;;;; process
   `(magit-process-ok    ((t (:foreground ,deut-green  :weight bold))))
   `(magit-process-ng    ((t (:foreground ,deut-red    :weight bold))))
;;;;;; log
   `(magit-log-author    ((t (:foreground ,deut-orange))))
   `(magit-log-date      ((t (:foreground ,deut-fg-1))))
   `(magit-log-graph     ((t (:foreground ,deut-fg+1))))
;;;;;; sequence
   `(magit-sequence-pick ((t (:foreground ,deut-yellow-2))))
   `(magit-sequence-stop ((t (:foreground ,deut-green))))
   `(magit-sequence-part ((t (:foreground ,deut-yellow))))
   `(magit-sequence-head ((t (:foreground ,deut-blue))))
   `(magit-sequence-drop ((t (:foreground ,deut-red))))
   `(magit-sequence-done ((t (:foreground ,deut-fg-1))))
   `(magit-sequence-onto ((t (:foreground ,deut-fg-1))))
;;;;;; bisect
   `(magit-bisect-good ((t (:foreground ,deut-green))))
   `(magit-bisect-skip ((t (:foreground ,deut-yellow))))
   `(magit-bisect-bad  ((t (:foreground ,deut-red))))
;;;;;; blame
   `(magit-blame-heading ((t (:background ,deut-bg-1 :foreground ,deut-blue-2))))
   `(magit-blame-hash    ((t (:background ,deut-bg-1 :foreground ,deut-blue-2))))
   `(magit-blame-name    ((t (:background ,deut-bg-1 :foreground ,deut-orange))))
   `(magit-blame-date    ((t (:background ,deut-bg-1 :foreground ,deut-orange))))
   `(magit-blame-summary ((t (:background ,deut-bg-1 :foreground ,deut-blue-2
                                          :weight bold))))
;;;;;; references etc
   `(magit-dimmed         ((t (:foreground ,deut-bg+3))))
   `(magit-hash           ((t (:foreground ,deut-bg+3))))
   `(magit-tag            ((t (:foreground ,deut-orange :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,deut-green  :weight bold))))
   `(magit-branch-local   ((t (:foreground ,deut-blue   :weight bold))))
   `(magit-branch-current ((t (:foreground ,deut-blue   :weight bold :box t))))
   `(magit-head           ((t (:foreground ,deut-blue   :weight bold))))
   `(magit-refname        ((t (:background ,deut-bg+2 :foreground ,deut-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,deut-bg+2 :foreground ,deut-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,deut-bg+2 :foreground ,deut-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,deut-green))))
   `(magit-signature-bad       ((t (:foreground ,deut-red))))
   `(magit-signature-untrusted ((t (:foreground ,deut-yellow))))
   `(magit-cherry-unmatched    ((t (:foreground ,deut-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,deut-magenta))))
   `(magit-reflog-commit       ((t (:foreground ,deut-green))))
   `(magit-reflog-amend        ((t (:foreground ,deut-magenta))))
   `(magit-reflog-merge        ((t (:foreground ,deut-green))))
   `(magit-reflog-checkout     ((t (:foreground ,deut-blue))))
   `(magit-reflog-reset        ((t (:foreground ,deut-red))))
   `(magit-reflog-rebase       ((t (:foreground ,deut-magenta))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,deut-green))))
   `(magit-reflog-remote       ((t (:foreground ,deut-cyan))))
   `(magit-reflog-other        ((t (:foreground ,deut-cyan))))
;;;;; message-mode
   `(message-cited-text ((t (:inherit font-lock-comment-face))))
   `(message-header-name ((t (:foreground ,deut-green+1))))
   `(message-header-other ((t (:foreground ,deut-green))))
   `(message-header-to ((t (:foreground ,deut-yellow :weight bold))))
   `(message-header-from ((t (:foreground ,deut-yellow :weight bold))))
   `(message-header-cc ((t (:foreground ,deut-yellow :weight bold))))
   `(message-header-newsgroups ((t (:foreground ,deut-yellow :weight bold))))
   `(message-header-subject ((t (:foreground ,deut-orange :weight bold))))
   `(message-header-xheader ((t (:foreground ,deut-green))))
   `(message-mml ((t (:foreground ,deut-yellow :weight bold))))
   `(message-separator ((t (:inherit font-lock-comment-face))))
;;;;; mew
   `(mew-face-header-subject ((t (:foreground ,deut-orange))))
   `(mew-face-header-from ((t (:foreground ,deut-yellow))))
   `(mew-face-header-date ((t (:foreground ,deut-green))))
   `(mew-face-header-to ((t (:foreground ,deut-red))))
   `(mew-face-header-key ((t (:foreground ,deut-green))))
   `(mew-face-header-private ((t (:foreground ,deut-green))))
   `(mew-face-header-important ((t (:foreground ,deut-blue))))
   `(mew-face-header-marginal ((t (:foreground ,deut-fg :weight bold))))
   `(mew-face-header-warning ((t (:foreground ,deut-red))))
   `(mew-face-header-xmew ((t (:foreground ,deut-green))))
   `(mew-face-header-xmew-bad ((t (:foreground ,deut-red))))
   `(mew-face-body-url ((t (:foreground ,deut-orange))))
   `(mew-face-body-comment ((t (:foreground ,deut-fg :slant italic))))
   `(mew-face-body-cite1 ((t (:foreground ,deut-green))))
   `(mew-face-body-cite2 ((t (:foreground ,deut-blue))))
   `(mew-face-body-cite3 ((t (:foreground ,deut-orange))))
   `(mew-face-body-cite4 ((t (:foreground ,deut-yellow))))
   `(mew-face-body-cite5 ((t (:foreground ,deut-red))))
   `(mew-face-mark-review ((t (:foreground ,deut-blue))))
   `(mew-face-mark-escape ((t (:foreground ,deut-green))))
   `(mew-face-mark-delete ((t (:foreground ,deut-red))))
   `(mew-face-mark-unlink ((t (:foreground ,deut-yellow))))
   `(mew-face-mark-refile ((t (:foreground ,deut-green))))
   `(mew-face-mark-unread ((t (:foreground ,deut-red-2))))
   `(mew-face-eof-message ((t (:foreground ,deut-green))))
   `(mew-face-eof-part ((t (:foreground ,deut-yellow))))
;;;;; mic-paren
   `(paren-face-match ((t (:foreground ,deut-cyan :background ,deut-bg :weight bold))))
   `(paren-face-mismatch ((t (:foreground ,deut-bg :background ,deut-magenta :weight bold))))
   `(paren-face-no-match ((t (:foreground ,deut-bg :background ,deut-red :weight bold))))
;;;;; mingus
   `(mingus-directory-face ((t (:foreground ,deut-blue))))
   `(mingus-pausing-face ((t (:foreground ,deut-magenta))))
   `(mingus-playing-face ((t (:foreground ,deut-cyan))))
   `(mingus-playlist-face ((t (:foreground ,deut-cyan ))))
   `(mingus-song-file-face ((t (:foreground ,deut-yellow))))
   `(mingus-stopped-face ((t (:foreground ,deut-red))))
;;;;; nav
   `(nav-face-heading ((t (:foreground ,deut-yellow))))
   `(nav-face-button-num ((t (:foreground ,deut-cyan))))
   `(nav-face-dir ((t (:foreground ,deut-green))))
   `(nav-face-hdir ((t (:foreground ,deut-red))))
   `(nav-face-file ((t (:foreground ,deut-fg))))
   `(nav-face-hfile ((t (:foreground ,deut-red-4))))
;;;;; mu4e
   `(mu4e-cited-1-face ((t (:foreground ,deut-blue    :slant italic))))
   `(mu4e-cited-2-face ((t (:foreground ,deut-green+2 :slant italic))))
   `(mu4e-cited-3-face ((t (:foreground ,deut-blue-2  :slant italic))))
   `(mu4e-cited-4-face ((t (:foreground ,deut-green   :slant italic))))
   `(mu4e-cited-5-face ((t (:foreground ,deut-blue-4  :slant italic))))
   `(mu4e-cited-6-face ((t (:foreground ,deut-green-1 :slant italic))))
   `(mu4e-cited-7-face ((t (:foreground ,deut-blue    :slant italic))))
   `(mu4e-replied-face ((t (:foreground ,deut-bg+3))))
   `(mu4e-trashed-face ((t (:foreground ,deut-bg+3 :strike-through t))))
;;;;; mumamo
   `(mumamo-background-chunk-major ((t (:background nil))))
   `(mumamo-background-chunk-submode1 ((t (:background ,deut-bg-1))))
   `(mumamo-background-chunk-submode2 ((t (:background ,deut-bg+2))))
   `(mumamo-background-chunk-submode3 ((t (:background ,deut-bg+3))))
   `(mumamo-background-chunk-submode4 ((t (:background ,deut-bg+1))))
;;;;; org-mode
   `(org-agenda-date-today
     ((t (:foreground ,deut-fg+1 :slant italic :weight bold))) t)
   `(org-agenda-structure
     ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,deut-fg :weight bold))))
   `(org-checkbox ((t (:background ,deut-bg+2 :foreground ,deut-fg+1
                                   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,deut-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,deut-red-1))))
   `(org-done ((t (:bold t :weight bold :foreground ,deut-green+3))))
   `(org-formula ((t (:foreground ,deut-yellow-2))))
   `(org-headline-done ((t (:foreground ,deut-green+3))))
   `(org-hide ((t (:foreground ,deut-bg-1))))
   `(org-level-1 ((t (:foreground ,deut-orange :height 10))))
   `(org-level-2 ((t (:foreground ,deut-green+4))))
   `(org-level-3 ((t (:foreground ,deut-blue-1))))
   `(org-level-4 ((t (:foreground ,deut-yellow-2))))
   `(org-level-5 ((t (:foreground ,deut-cyan))))
   `(org-level-6 ((t (:foreground ,deut-green+2))))
   `(org-level-7 ((t (:foreground ,deut-red-4))))
   `(org-level-8 ((t (:foreground ,deut-blue-4))))
   `(org-link ((t (:foreground ,deut-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,deut-green+4))))
   `(org-scheduled-previously ((t (:foreground ,deut-red))))
   `(org-scheduled-today ((t (:foreground ,deut-blue+1))))
   `(org-sexp-date ((t (:foreground ,deut-blue+1 :underline t))))
   `(org-special-keyword ((t (:inherit font-lock-comment-face))))
   `(org-table ((t (:foreground ,deut-green+2))))
   `(org-tag ((t (:bold t :weight bold))))
   `(org-time-grid ((t (:foreground ,deut-orange))))
   `(org-todo ((t (:bold t :foreground ,deut-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face))))
   `(org-warning ((t (:bold t :foreground ,deut-red :weight bold :underline nil))))
   `(org-column ((t (:background ,deut-bg-1))))
   `(org-column-title ((t (:background ,deut-bg-1 :underline t :weight bold))))
   `(org-mode-line-clock ((t (:foreground ,deut-fg :background ,deut-bg-1))))
   `(org-mode-line-clock-overrun ((t (:foreground ,deut-bg :background ,deut-red-1))))
   `(org-ellipsis ((t (:foreground ,deut-yellow-1 :underline t))))
   `(org-footnote ((t (:foreground ,deut-cyan :underline t))))
;;;;; outline
   `(outline-1 ((t (:foreground ,deut-orange))))
   `(outline-2 ((t (:foreground ,deut-green+4))))
   `(outline-3 ((t (:foreground ,deut-blue-1))))
   `(outline-4 ((t (:foreground ,deut-yellow-2))))
   `(outline-5 ((t (:foreground ,deut-cyan))))
   `(outline-6 ((t (:foreground ,deut-green+2))))
   `(outline-7 ((t (:foreground ,deut-red-4))))
   `(outline-8 ((t (:foreground ,deut-blue-4))))
;;;;; p4
   `(p4-depot-added-face ((t :inherit diff-added)))
   `(p4-depot-branch-op-face ((t :inherit diff-changed)))
   `(p4-depot-deleted-face ((t :inherit diff-removed)))
   `(p4-depot-unmapped-face ((t :inherit diff-changed)))
   `(p4-diff-change-face ((t :inherit diff-changed)))
   `(p4-diff-del-face ((t :inherit diff-removed)))
   `(p4-diff-file-face ((t :inherit diff-file-header)))
   `(p4-diff-head-face ((t :inherit diff-header)))
   `(p4-diff-ins-face ((t :inherit diff-added)))
;;;;; perspective
   `(persp-selected-face ((t (:foreground ,deut-yellow-2 :inherit mode-line))))
;;;;; powerline
   `(powerline-active1 ((t (:background ,deut-bg-05 :inherit mode-line))))
   `(powerline-active2 ((t (:background ,deut-bg+2 :inherit mode-line))))
   `(powerline-inactive1 ((t (:background ,deut-bg+1 :inherit mode-line-inactive))))
   `(powerline-inactive2 ((t (:background ,deut-bg+3 :inherit mode-line-inactive))))
;;;;; proofgeneral
   `(proof-active-area-face ((t (:underline t))))
   `(proof-boring-face ((t (:foreground ,deut-fg :background ,deut-bg+2))))
   `(proof-command-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-debug-message-face ((t (:inherit proof-boring-face))))
   `(proof-declaration-name-face ((t (:inherit font-lock-keyword-face :foreground nil))))
   `(proof-eager-annotation-face ((t (:foreground ,deut-bg :background ,deut-orange))))
   `(proof-error-face ((t (:foreground ,deut-fg :background ,deut-red-4))))
   `(proof-highlight-dependency-face ((t (:foreground ,deut-bg :background ,deut-yellow-1))))
   `(proof-highlight-dependent-face ((t (:foreground ,deut-bg :background ,deut-orange))))
   `(proof-locked-face ((t (:background ,deut-blue-5))))
   `(proof-mouse-highlight-face ((t (:foreground ,deut-bg :background ,deut-orange))))
   `(proof-queue-face ((t (:background ,deut-red-4))))
   `(proof-region-mouse-highlight-face ((t (:inherit proof-mouse-highlight-face))))
   `(proof-script-highlight-error-face ((t (:background ,deut-red-2))))
   `(proof-tacticals-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,deut-bg))))
   `(proof-tactics-name-face ((t (:inherit font-lock-constant-face :foreground nil :background ,deut-bg))))
   `(proof-warning-face ((t (:foreground ,deut-bg :background ,deut-yellow-1))))
;;;;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,deut-fg))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,deut-green+4))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,deut-yellow-2))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,deut-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,deut-green+2))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,deut-blue+1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,deut-yellow-1))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,deut-green+1))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,deut-blue-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,deut-orange))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,deut-green))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,deut-blue-5))))
;;;;; rcirc
   `(rcirc-my-nick ((t (:foreground ,deut-blue))))
   `(rcirc-other-nick ((t (:foreground ,deut-orange))))
   `(rcirc-bright-nick ((t (:foreground ,deut-blue+1))))
   `(rcirc-dim-nick ((t (:foreground ,deut-blue-2))))
   `(rcirc-server ((t (:foreground ,deut-green))))
   `(rcirc-server-prefix ((t (:foreground ,deut-green+1))))
   `(rcirc-timestamp ((t (:foreground ,deut-green+2))))
   `(rcirc-nick-in-message ((t (:foreground ,deut-yellow))))
   `(rcirc-nick-in-message-full-line ((t (:bold t))))
   `(rcirc-prompt ((t (:foreground ,deut-yellow :bold t))))
   `(rcirc-track-nick ((t (:inverse-video t))))
   `(rcirc-track-keyword ((t (:bold t))))
   `(rcirc-url ((t (:bold t))))
   `(rcirc-keyword ((t (:foreground ,deut-yellow :bold t))))
;;;;; rpm-mode
   `(rpm-spec-dir-face ((t (:foreground ,deut-green))))
   `(rpm-spec-doc-face ((t (:foreground ,deut-green))))
   `(rpm-spec-ghost-face ((t (:foreground ,deut-red))))
   `(rpm-spec-macro-face ((t (:foreground ,deut-yellow))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground ,deut-red))))
   `(rpm-spec-package-face ((t (:foreground ,deut-red))))
   `(rpm-spec-section-face ((t (:foreground ,deut-yellow))))
   `(rpm-spec-tag-face ((t (:foreground ,deut-blue))))
   `(rpm-spec-var-face ((t (:foreground ,deut-red))))
;;;;; rst-mode
   `(rst-level-1-face ((t (:foreground ,deut-orange))))
   `(rst-level-2-face ((t (:foreground ,deut-green+1))))
   `(rst-level-3-face ((t (:foreground ,deut-blue-1))))
   `(rst-level-4-face ((t (:foreground ,deut-yellow-2))))
   `(rst-level-5-face ((t (:foreground ,deut-cyan))))
   `(rst-level-6-face ((t (:foreground ,deut-green-1))))
;;;;; sh-mode
   `(sh-heredoc     ((t (:foreground ,deut-yellow :bold t))))
   `(sh-quoted-exec ((t (:foreground ,deut-red))))
;;;;; show-paren
   `(show-paren-mismatch ((t (:foreground ,deut-red+1 :background ,deut-bg+3 :weight bold))))
   `(show-paren-match ((t (:background ,deut-bg+3 :weight bold))))
;;;;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,deut-red+1 :background ,deut-bg+3 :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,deut-bg+3 :weight bold))))
;;;;; sml-mode-line
   '(sml-modeline-end-face ((t :inherit default :width condensed)))
;;;;; SLIME
   `(slime-repl-output-face ((t (:foreground ,deut-red))))
   `(slime-repl-inputed-output-face ((t (:foreground ,deut-green))))
   `(slime-error-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-red)))
      (t
       (:underline ,deut-red))))
   `(slime-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-orange)))
      (t
       (:underline ,deut-orange))))
   `(slime-style-warning-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-yellow)))
      (t
       (:underline ,deut-yellow))))
   `(slime-note-face
     ((((supports :underline (:style wave)))
       (:underline (:style wave :color ,deut-green)))
      (t
       (:underline ,deut-green))))
   `(slime-highlight-face ((t (:inherit highlight))))
;;;;; speedbar
   `(speedbar-button-face ((t (:foreground ,deut-green+2))))
   `(speedbar-directory-face ((t (:foreground ,deut-cyan))))
   `(speedbar-file-face ((t (:foreground ,deut-fg))))
   `(speedbar-highlight-face ((t (:foreground ,deut-bg :background ,deut-green+2))))
   `(speedbar-selected-face ((t (:foreground ,deut-red))))
   `(speedbar-separator-face ((t (:foreground ,deut-bg :background ,deut-blue-1))))
   `(speedbar-tag-face ((t (:foreground ,deut-yellow))))
;;;;; tabbar
   `(tabbar-button ((t (:foreground ,deut-fg
                                    :background ,deut-bg))))
   `(tabbar-selected ((t (:foreground ,deut-fg
                                      :background ,deut-bg
                                      :box (:line-width -1 :style pressed-button)))))
   `(tabbar-unselected ((t (:foreground ,deut-fg
                                        :background ,deut-bg+1
                                        :box (:line-width -1 :style released-button)))))
;;;;; term
   `(term-color-black ((t (:foreground ,deut-bg
                                       :background ,deut-bg-1))))
   `(term-color-red ((t (:foreground ,deut-red-2
                                       :background ,deut-red-4))))
   `(term-color-green ((t (:foreground ,deut-green
                                       :background ,deut-green+2))))
   `(term-color-yellow ((t (:foreground ,deut-orange
                                       :background ,deut-yellow))))
   `(term-color-blue ((t (:foreground ,deut-blue-1
                                      :background ,deut-blue-4))))
   `(term-color-magenta ((t (:foreground ,deut-magenta
                                         :background ,deut-red))))
   `(term-color-cyan ((t (:foreground ,deut-cyan
                                       :background ,deut-blue))))
   `(term-color-white ((t (:foreground ,deut-fg
                                       :background ,deut-fg-1))))
   '(term-default-fg-color ((t (:inherit term-color-white))))
   '(term-default-bg-color ((t (:inherit term-color-black))))
;;;;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,deut-fg+1 :weight bold))))
   `(undo-tree-visualizer-current-face ((t (:foreground ,deut-red-1 :weight bold))))
   `(undo-tree-visualizer-default-face ((t (:foreground ,deut-fg))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,deut-yellow))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,deut-cyan))))
;;;;; volatile-highlights
   `(vhl/default-face ((t (:background ,deut-bg-05))))
;;;;; web-mode
   `(web-mode-builtin-face ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face ((t (:foreground ,deut-orange ))))
   `(web-mode-css-prop-face ((t (:foreground ,deut-orange))))
   `(web-mode-css-pseudo-class-face ((t (:foreground ,deut-green+3 :weight bold))))
   `(web-mode-css-rule-face ((t (:foreground ,deut-blue))))
   `(web-mode-doctype-face ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face ((t (:underline t))))
   `(web-mode-function-name-face ((t (:foreground ,deut-blue))))
   `(web-mode-html-attr-name-face ((t (:foreground ,deut-orange))))
   `(web-mode-html-attr-value-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face ((t (:foreground ,deut-cyan))))
   `(web-mode-keyword-face ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face ((t (:background ,deut-bg))))
   `(web-mode-server-comment-face ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face ((t (:background ,deut-red))))
;;;;; whitespace-mode
   `(whitespace-space ((t (:background ,deut-bg+1 :foreground ,deut-bg+1))))
   `(whitespace-hspace ((t (:background ,deut-bg+1 :foreground ,deut-bg+1))))
   `(whitespace-tab ((t (:background ,deut-red-1))))
   `(whitespace-newline ((t (:foreground ,deut-bg+1))))
   `(whitespace-trailing ((t (:background ,deut-red))))
   `(whitespace-line ((t (:background ,deut-bg :foreground ,deut-magenta))))
   `(whitespace-space-before-tab ((t (:background ,deut-orange :foreground ,deut-orange))))
   `(whitespace-indentation ((t (:background ,deut-yellow :foreground ,deut-red))))
   `(whitespace-empty ((t (:background ,deut-yellow))))
   `(whitespace-space-after-tab ((t (:background ,deut-yellow :foreground ,deut-red))))
;;;;; wanderlust
   `(wl-highlight-folder-few-face ((t (:foreground ,deut-red-2))))
   `(wl-highlight-folder-many-face ((t (:foreground ,deut-red-1))))
   `(wl-highlight-folder-path-face ((t (:foreground ,deut-orange))))
   `(wl-highlight-folder-unread-face ((t (:foreground ,deut-blue))))
   `(wl-highlight-folder-zero-face ((t (:foreground ,deut-fg))))
   `(wl-highlight-folder-unknown-face ((t (:foreground ,deut-blue))))
   `(wl-highlight-message-citation-header ((t (:foreground ,deut-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:foreground ,deut-red))))
   `(wl-highlight-message-cited-text-2 ((t (:foreground ,deut-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:foreground ,deut-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:foreground ,deut-blue+1))))
   `(wl-highlight-message-header-contents-face ((t (:foreground ,deut-green))))
   `(wl-highlight-message-headers-face ((t (:foreground ,deut-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:foreground ,deut-green+2))))
   `(wl-highlight-message-header-contents ((t (:foreground ,deut-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:foreground ,deut-green+2))))
   `(wl-highlight-message-signature ((t (:foreground ,deut-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:foreground ,deut-fg))))
   `(wl-highlight-summary-answered-face ((t (:foreground ,deut-blue))))
   `(wl-highlight-summary-disposed-face ((t (:foreground ,deut-fg
                                                         :slant italic))))
   `(wl-highlight-summary-new-face ((t (:foreground ,deut-blue))))
   `(wl-highlight-summary-normal-face ((t (:foreground ,deut-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,deut-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,deut-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:foreground ,deut-fg))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))
;;;;; which-func-mode
   `(which-func ((t (:foreground ,deut-green+4))))
;;;;; yascroll
   `(yascroll:thumb-text-area ((t (:background ,deut-bg-1))))
   `(yascroll:thumb-fringe ((t (:background ,deut-bg-1 :foreground ,deut-bg-1))))
   ))

;;; Theme Variables
(deut-with-color-variables
  (custom-theme-set-variables
   'deut
;;;;; ansi-color
   `(ansi-color-names-vector [,deut-bg ,deut-red ,deut-green ,deut-yellow
                                          ,deut-blue ,deut-magenta ,deut-cyan ,deut-fg])
;;;;; fill-column-indicator
   `(fci-rule-color ,deut-bg+3)
;;;;; vc-annotate
   `(vc-annotate-color-map
     '(( 20. . ,deut-red-1)
       ( 40. . ,deut-red)
       ( 60. . ,deut-orange)
       ( 80. . ,deut-yellow-2)
       (100. . ,deut-yellow-1)
       (120. . ,deut-yellow)
       (140. . ,deut-green-1)
       (160. . ,deut-green)
       (180. . ,deut-green+1)
       (200. . ,deut-green+2)
       (220. . ,deut-green+3)
       (240. . ,deut-green+4)
       (260. . ,deut-cyan)
       (280. . ,deut-blue-2)
       (300. . ,deut-blue-1)
       (320. . ,deut-blue)
       (340. . ,deut-blue+1)
       (360. . ,deut-magenta)))
   `(vc-annotate-very-old-color ,deut-magenta)
   `(vc-annotate-background ,deut-bg-1)
   ))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar deut-add-font-lock-keywords nil
  "Whether to add font-lock keywords for deut color names.
In buffers visiting library `deut-theme.el' the deut
specific keywords are always added.  In all other Emacs-Lisp
buffers this variable controls whether this should be done.
This requires library `rainbow-mode'.")

(defvar deut-colors-font-lock-keywords nil)

;; (defadvice rainbow-turn-on (after deut activate)
;;   "Maybe also add font-lock keywords for deut colors."
;;   (when (and (derived-mode-p 'emacs-lisp-mode)
;;              (or deut-add-font-lock-keywords
;;                  (equal (file-name-nondirectory (buffer-file-name))
;;                         "deut-theme.el")))
;;     (unless deut-colors-font-lock-keywords
;;       (setq deut-colors-font-lock-keywords
;;             `((,(regexp-opt (mapcar 'car deut-colors-alist) 'words)
;;                (0 (rainbow-colorize-by-assoc deut-colors-alist))))))
;;     (font-lock-add-keywords nil deut-colors-font-lock-keywords)))

;; (defadvice rainbow-turn-off (after deut activate)
;;   "Also remove font-lock keywords for deut colors."
;;   (font-lock-remove-keywords nil deut-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'deut)

;; Local Variables:
;; no-byte-compile: t
;; indent-tabs-mode: nil
;; eval: (when (require 'rainbow-mode nil t) (rainbow-mode 1))
;; End:
;;; deut-theme.el ends here
