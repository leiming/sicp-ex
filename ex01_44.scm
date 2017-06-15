#lang sicp

(#%require "ex01_43.scm")

(define dx 0.000001)

(define (smooth g)
  (lambda (x)
    (/ (+ (g (- x dx))
          (g x)
          (g (+ x dx)))
       3)))

(define (smooth-repeated g n)
  ((repeated smooth n) g))

((smooth-repeated (lambda (x) (* x x x)) 3) 3)
