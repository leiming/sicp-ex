#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

;(fixed-point cos 1.0)

(define (theta x)
  (+ 1 (/ 1 x)))

;(fixed-point theta 1.0)
