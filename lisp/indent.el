;; C, C++
(defun c-c++-indent ()
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))
(add-hook 'c-mode-hook 'c-c++-indent)
(add-hook 'c++-mode-hook 'c-c++-indent)

(provide 'indent)
