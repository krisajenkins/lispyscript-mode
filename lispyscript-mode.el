;;; lispyscript-mode.el --- Major mode for LispyScript code.

;; Copyright 2013 Kris Jenkins
;; Author: Kris Jenkins
;; URL: https://github.com/krisajenkins/lispyscript-mode
;; Version: 0.2.0

(require 'lisp-mode)
(require 'font-lock)

;;;###autoload
(defvar lispyscript-font-lock-defaults
  `((,(rx "(" (group (or "macro")) (one-or-more whitespace) (group (one-or-more word)))
  	 (1 font-lock-keyword-face)
  	 (2 font-lock-function-name-face))
	(,(rx "("
		  (group (or "var" "set" "template" "doMonad" "monad" "withMonad" "testGroup" "testRunner"))
		  (one-or-more whitespace) (group (one-or-more word)))
  	 (1 font-lock-keyword-face)
  	 (2 font-lock-variable-name-face))
  	(,(rx "("
		  (group (or "->"
					 "array" "arrayInit" "arrayInit2d" "object" "new" "javascript"
					 "if" "cond" "when" "unless" "do" "function" "try" "catch" "throw" "loop"
					 "each" "each2d" "eachKey" "reduce" "map" "for"
					 "template-repeat" "template-repeat-key"
					 "include"
					 "assert")))
  	 (1 font-lock-keyword-face))))

;;;###autoload
(define-derived-mode lispyscript-mode lisp-mode "LispyScript"
  "Major mode for LispyScript"
  (modify-syntax-entry ?_ "w" lispyscript-mode-syntax-table)
  (modify-syntax-entry ?~ "w" lispyscript-mode-syntax-table)
  (modify-syntax-entry ?- "w" lispyscript-mode-syntax-table)
  (modify-syntax-entry ?> "w" lispyscript-mode-syntax-table)
  (modify-syntax-entry ?? "w" lispyscript-mode-syntax-table)
  (setq font-lock-defaults '((lispyscript-font-lock-defaults))))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ls$" . lispyscript-mode))

(provide 'lispyscript-mode)
;;; lispyscript-mode.el ends here
