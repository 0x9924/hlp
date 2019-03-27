(defclass point () 
  ((x :initarg :x)
   (y :initarg :y)))
   
(cl-defmethod sum ((p point) (q point))
  (point :x (+ (oref p :x) (oref q :x))
         :y (+ (oref p :y) (oref q :y))))
         
(cl-defmethod norm2 ((p point))
  (sqrt (+ (oref p :x) (oref p :y)))
