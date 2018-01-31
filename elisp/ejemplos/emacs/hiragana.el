
(setq hiragana (reverse '(ん わ ら や ま は な た さ か あ り み ひ に ち し き い る ゆ む ふ ぬ つ す く う れ め へ ね て せ け え を ろ よ も ほ の と そ こ お ぱ ば だ ざ が ぴ び ぢ じ ぎ ぷ ぶ づ ず ぐ ぺ べ で ぜ げ ぽ ぼ ど ぞ ご ぴゃ びゃ じゃ ぎゃ りゃ みゃ ひゃ にゃ ちゃ しゃ きゃ ぴゅ びゅ じゅ ぎゅ りゅ みゅ ひゅ にゅ ちゅ しゅ きゅ ぴょ びょ じょ ぎょ りょ みょ ひょ にょ ちょ しょ きょ おお ええ うう いい ああ)))

(setq romaji (reverse '(n wa ra ya ma ha na ta sa ka a ri mi hi ni chi shi ki i ru yu mu fu nu tsu su ku u re me he ne te se ke e wo ro yo mo ho no to so ko o pa ba da za ga pi bi ji ji gi pu bu dzu zu gu pe be de ze ge po bo do zo go pya bya jya gya rya mya hya nya cha sha kya pyu byu jyu gyu ryu myu hyu nyu chu shu kyu pyo byo jyo gyo ryo myo hyo nyo cho sho kyo oo ee uu ii aa)))

(defun hiragana2romaji ()
  (dotimes (n (length hiragana))
    (replace-string (symbol-name (nth n hiragana)) (symbol-name (nth n romaji)) nil 1 (point-max)))
  (replace-regexp "っ\\([a-z]\\)" "\\1\\1" nil 1 (point-max))
  (interactive nil))



(defun prueba1 ()
  (replace-regexp "っ\\([a-z]\\)" "\\1\\1" nil 1 (point-max))
  (interactive nil))
