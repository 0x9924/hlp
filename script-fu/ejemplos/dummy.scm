(define (my-dummy-function a b)
  (print "Do nothing"))

(script-fu-register "my-dummy-function"                                 ;func name
		    "Dummy"<Toolbox>/Xtns/Script-Fu/My Stuff/Dummy..."  ,menu label
		    "Do nothing"
		    "Joey User"
		    "Joey User"
		    "August 2000"
		    ""
		    SF-ADJUSTMENT _"Width" '(400 1 2000 1 10 0 1)
		    SF-ADJUSTMENT _"Height" '(30 1 2000 1 10 0 1))

(script-fu-register
    "script-fu-text-box"                        ;func name
    "Text Box"                                  ;menu label
    "Creates a simple text box, sized to fit\
      around the user's choice of text,\
      font, font size, and color."              ;description
    "Michael Terry"                             ;author
    "copyright 1997, Michael Terry;\
      2009, the GIMP Documentation Team"        ;copyright notice
    "October 27, 1997"                          ;date created
    ""                     ;image type that the script works on
    SF-STRING      "Text"          "Text Box"   ;a string variable
    SF-FONT        "Font"          "Charter"    ;a font variable
    SF-ADJUSTMENT  "Font size"     '(50 1 1000 1 10 0 1)
                                                ;a spin-button
    SF-COLOR       "Color"         '(0 0 0)     ;color variable
  )
  (script-fu-menu-register "script-fu-text-box" "<Image>/File/Create/Text")
