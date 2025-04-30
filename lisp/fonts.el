;; East Asia: 你好, 早晨, こんにちは, 안녕하세요
(setq han-bopomofo-misc "Noto Sans CJK SC")
(setq japanese-kana "Noto Sans CJK JP")
(setq korean-hangul "Noto Sans CJK KR")
;; Emoji: 🇭🇰 🏳️‍⚧️
(if (eq system-type 'windows-nt)
    (setq emoji-font "Segoe UI Emoji") ; Colorful emojis can't display on Windows. Stupid Microsoft!
  (setq emoji-font "Twemoji Mozilla")) ; Need install Twemoji Mozilla first.

;; -- do not edit below --
(when (member han-bopomofo-misc (font-family-list))
  (set-fontset-font t 'cjk-misc han-bopomofo-misc))
(when (member han-bopomofo-misc (font-family-list))
  (set-fontset-font t 'han han-bopomofo-misc))
(when (member han-bopomofo-misc (font-family-list))
  (set-fontset-font t 'bopomofo han-bopomofo-misc))
(when (member japanese-kana (font-family-list))
  (set-fontset-font t 'kana japanese-kana))
(when (member korean-hangul (font-family-list))
  (set-fontset-font t 'hangul korean-hangul))
(when (member emoji-font (font-family-list))
  (set-fontset-font t 'emoji emoji-font))

(provide 'fonts)
