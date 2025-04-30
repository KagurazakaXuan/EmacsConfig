(defun set-theme-based-on-time ()
  (let ((hour (string-to-number (format-time-string "%H"))))
    (if (and (>= hour 7) (< hour 21)) ; 07:00 - 21:00 use light, otherwise dark
        (load-theme 'solarized-light t)
      (load-theme 'solarized-dark t))))

(add-hook 'emacs-startup-hook 'set-theme-based-on-time)

(provide 'autotheme)
