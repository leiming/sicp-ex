#lang sicp

(define tolernace 0.00001)

(define (close-enough? a b)
  (< (abs (- a b)) tolernace))

(define (iterative-improve good-enough? improve-guess)
  (lambda (x)
    (let ((improve-x (improve-guess x)))
      (if (good-enough? x improve-x)
          improve-x
          ((iterative-improve good-enough? improve-guess) improve-x)))))

(define (sqrt x)
  (define (improve-guess y)
    (/ (+ y (/ x y)) 2.0))
  ((iterative-improve close-enough? improve-guess) 1.0))

(sqrt 3)

(define (fixed-point f first-guess)
  ((iterative-improve close-enough? f) first-guess))

(fixed-point cos 1)
