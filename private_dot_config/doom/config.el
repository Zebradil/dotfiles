;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "German Lashevich"
      user-mail-address "german.lashevich@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka" :size 18)
      doom-variable-pitch-font (font-spec :family "Iosevka") ; inherits `doom-font''s :size
      )

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.



(setq deft-directory "~/notes")

(use-package! org-super-agenda :hook (org-agenda-mode . org-super-agenda-mode))

;;; :lang org
(setq org-directory "~/org/"
      org-archive-location (concat org-directory ".archive/%s::")
      org-roam-directory (concat org-directory "notes/")
      org-roam-db-location (concat org-roam-directory ".org-roam.db")
      org-journal-encrypt-journal t
      org-journal-file-format "%Y%m%d.org"
      org-ellipsis " [...] "
      org-log-done 'note
      org-agenda-files (directory-files-recursively org-directory "\\.org$")
      org-todo-keyword-faces
      '(; Copied from css and processed with :'<,'>s/\v\.org-todo-(\w+)[^#]+(#\w+).*/("\U\1\E" :foreground "\2")
        ("IDEA" :foreground "#003300")
        ("TODO" :foreground "#009900")
        ("STRT" :foreground "#999900")
        ("WAIT" :foreground "#3f3f7f")
        ("HOLD" :foreground "#3f7f7f")
        ("DONE" :foreground "#3f7f3f")
        ("KILL" :foreground "#7f3f3f")
        ("PROJ" :foreground "#35354c")
        ("LOOP" :foreground "#354c4c"))
      org-agenda-custom-commands
      '(
        ("n" "Agenda and all TODOs"
         ((agenda ""
                  ((org-agenda-span 7)
                   (org-agenda-repeating-timestamp-show-all t)))
          (todo "")))
        ("h" "Agenda and Home-related tasks"
         ((agenda ""
                  ((org-agenda-span 7)
                   (org-agenda-repeating-timestamp-show-all t)))
          (tags-todo "common" ((org-super-agenda-groups
                                '((:auto-parent t))))))
         ((org-agenda-tag-filter-preset '("+common")))
         ("~/org/export/home.html"))))

;; TODO insert HTML_HEAD_EXTRA on org-agenda-before-write-hook

(setq org-agenda-export-html-style
      "<style>
      body {
        color: #eaeaea;
        background-color: #000000;
        font-size: 2em;
      }
      .custom {
        /* (:foreground gold) */
        color: #ffd700;
      }
      .org-agenda-date {
        /* org-agenda-date */
        color: #7aa6da;
      }
      .org-agenda-date-today {
        /* org-agenda-date-today */
        color: #7aa6da;
        font-weight: bold;
        font-style: italic;
      }
      .org-agenda-date-weekend {
        /* org-agenda-date-weekend */
        color: #7aa6da;
        font-weight: bold;
      }
      .org-agenda-structure {
        /* org-agenda-structure */
        color: #c397d8;
      }
      .org-scheduled-today {
        /* org-scheduled-today */
        color: #b9ca4a;
      }
      .org-tag {
        /* org-tag */
        font-weight: bold;
      }
      .org-todo {
        /* org-todo */
        font-weight: bold;
      }
      .org-todo-idea { color: hsl(120,100%,20%); } /* #003300 */
      .org-todo-todo { color: hsl(120,100%,60%); } /* #009900 */
      .org-todo-strt { color: hsl( 60,100%,60%); } /* #999900 */
      .org-todo-wait { color: hsl(240, 50%,50%); } /* #3f3f7f */
      .org-todo-hold { color: hsl(180, 50%,50%); } /* #3f7f7f */
      .org-todo-done { color: hsl(120, 50%,50%); } /* #3f7f3f */
      .org-todo-kill { color: hsl(  0, 50%,50%); } /* #7f3f3f */
      .org-todo-proj { color: hsl(240, 30%,30%); } /* #35354c */
      .org-todo-loop { color: hsl(180, 30%,30%); } /* #354c4c */
      .warning {
        /* warning */
        color: #e78c45;
      }

      a {
        color: inherit;
        background-color: inherit;
        font: inherit;
        text-decoration: inherit;
      }
      a:hover {
        text-decoration: underline;
      }
      </style>
      <script>
      document.addEventListener('DOMContentLoaded', function(event) {
          //for (const todoItem of document.getElementsByClassName('org-todo')) {
          for (const todoItem of document.getElementsByTagName('span')) {
              const allowed = ['IDEA', 'TODO', 'STRT', 'WAIT', 'HOLD', 'DONE', 'KILL', 'PROJ', 'LOOP'];
              if (allowed.includes(todoItem.innerText)) {
                  todoItem.classList.add('org-todo-' + todoItem.innerText.trim().toLowerCase());
              }
          }
      });
      </script>")
