;;; souffle-mode.el --- Major mode for Souffle datalog files. -*- lexical-binding: t -*-

;; Copyright (C) 2017 Erik Post

;; Author   : Erik Post <erik@shinsetsu.nl>
;; Homepage : https://github.com/epost/souffle-mode
;; Version  : 0.1.0
;; Keywords : languages

;;; Commentary:

;; Emacs integration for Souffle datalog files

;;; Code:

(defconst souffle-mode-syntax-table
  (let ((table (make-syntax-table)))
    (modify-syntax-entry ?/ "< 1" table)
    (modify-syntax-entry ?/ "< 2" table)
    (modify-syntax-entry ?\n "> " table)
    table))

(setq souffle-highlights
      '((":-\\|=\\|:\\|\\[\\|\\]\\|\\.type\\|\\.decl\\|\\.comp\\|\\.init\\|\\." . font-lock-keyword-face)
        ("\\number\\|symbol" . font-lock-builtin-face)
        (":" . font-lock-constant-face)))

;;;###autoload
(define-derived-mode souffle-mode fundamental-mode "souffle"
  "major mode for editing Souffle datalog files."
  :syntax-table souffle-mode-syntax-table
  (setq font-lock-defaults '(souffle-highlights))

  (setq-local comment-start "\/\/")
  (setq-local comment-end "")
)

(provide 'souffle-mode)
