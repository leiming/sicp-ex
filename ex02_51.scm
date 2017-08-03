#lang sicp

(#%require sicp-pict)

(define (below-one painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
            ((transform-painter (make-vect 0.0 0.0)
                                (make-vect 1.0 0.0)
                                split-point) painter1))
          (paint-top
            ((transform-painter split-point
                                (make-vect 1.0 0.5)
                                (make-vect 0.0 1.0)) painter2)))
      (lambda (frame)
        (paint-top frame)
        (paint-bottom frame)))))                  

(define (below-two painter1 painter2)
  (rotate90 (beside (rotate270 painter2) (rotate270 painter1))))

(paint einstein)
(paint (beside einstein einstein))
(paint (below-one einstein einstein))
(paint (below-two einstein einstein))