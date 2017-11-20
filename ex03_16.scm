#lang sicp

(#%require "ex03_13.scm")

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define y1 (cons 1 1))
(define y2 (cons 2 2))
(define y3 (cons y1 y2))
(count-pairs y3)
;;; 3

(define w1 (cons 1 1))
(define w2 (cons w1 2))
(define w3 (cons w2 w1))
(count-pairs w3)
;;; 4

(define x1 (cons 1 1))
(define x2 (cons x1 2))
(define x3 (cons x2 x2))
(count-pairs x3)
;;; 5

(define z1 (cons 1 1))
(define z2 (cons z1 z1))
(define z3 (cons z2 z2))
(count-pairs z3)
;;; 7

(define v1 (cons 1 (cons 2 (cons 3 nil))))
(define v2 (make-cycle v1))
;(count-pairs v2)
;不返回数，死循环
