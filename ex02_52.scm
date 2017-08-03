#lang sicp

(#%require sicp-pict)

(define (right-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (right-split painter (- n 1))))
      (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n 0)
    painter
    (let ((smaller (right-split painter (- n 1))))
      (below painter (beside smaller smaller)))))
      
(define (flip-horiz painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)) painter))

(define (corner-split painter n) 
  (if (= n 0) 
     painter 
     (beside (below painter (up-split painter (- n 1))) 
             (below (right-split painter (- n 1)) (corner-split painter (- n 1))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n) 
  (let ((combine4 (square-of-four flip-vert rotate180 
                                  identity flip-horiz))) 
      (combine4 (corner-split painter n))))

(paint (corner-split einstein 3))
(paint (square-limit einstein 3))
