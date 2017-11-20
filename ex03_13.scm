#lang sicp

(#%provide
  last-pair
  make-cycle)


(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)


(define x (list 'a 'b 'c))

(define y (make-cycle x))

;(display y)
;;; #<void>

;(newline)

;(display x)
;;; #0=(a b c . #0#)
