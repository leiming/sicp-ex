#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

(define (log-progress x)
  (/ (log 1000) (log x)))

;(fixed-point log-progress 500)
