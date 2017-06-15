#lang sicp

(#%require "ex01_20.scm")

(define (make-rat n d)
  (let ((g (abs (gcd n d)))
        (isNegative (negative? (* n d)))
        (abs-n (abs n))
        (abs-d (abs d)))
    (if isNegative
        (cons (- (/ abs-n g)) (/ abs-d g))
        (cons (/ abs-n g) (/ abs-d g)))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;(define a (make-rat 2 4))
;(define b (make-rat -2 4))
;(define c (make-rat 2 -4))
;(define d (make-rat -2 -4))
;
;(print-rat a)
;(print-rat b)
;(print-rat c)
;(print-rat d)
