#lang racket
(require racket/trace)
(require (planet neil/sicp))

;;; http://sicp.readthedocs.org/en/latest/chp1/6.html
(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (improve-good-enough? guess (improve guess x))
      (improve guess x)
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (avarange guess (/ x guess)))

(define (avarange x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.01))

(define (improve-good-enough? guess new-guess)
  (< (abs (- 1
             (/ guess new-guess))) 0.001))

(define (my-sqrt x)
  (sqrt-iter 1.0 x))

(display (my-sqrt 0.00009))
