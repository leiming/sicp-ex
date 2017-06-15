#lang sicp

(#%provide square inc)

(define (inc x)
  (+ x 1))

(define (square x) (* x x))

(define (double g)
  (lambda (x) (g (g x))))

;((double inc) 3)
;;; 5

;(((double (double double)) inc) 1)
;;; 17
