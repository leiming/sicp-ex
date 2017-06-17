#lang sicp

(#%require "ex01_45.scm")

(define (pow-cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (log-floor base y)
  (define (log-iter base y i)
    (let ((r (remainder y base)))
      (if (= r 0)
        (log-iter base (/ y base) (+ 1 i))
        i)))
  (log-iter base y 0))

(define (pow-car z)
  (log-floor 2 z))

(define (pow-cdr z)
  (log-floor 3 z))

(define cons-one (pow-cons 4 7))
(pow-car cons-one)
(pow-cdr cons-one)
