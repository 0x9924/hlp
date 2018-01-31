(define (my-make-new-image)
  (let* ((image (car (gimp-image-new 256 256 RGB)))
	 (layer (car (gimp-layer-new image 256 256
				     RGB-IMAGE "foobar" 100 NORMAL-MODE))))
    (gimp-drawable-fill layer BG-IMAGE-FILL)
    (gimp-image-add-layer image layer 0)
    (gimp-display-new  image)
    image))
