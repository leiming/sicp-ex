#lang sicp

(#%require "ex02_46.scm")
(#%provide make-segment start-segment end-segment)

(define (make-segment start end)
    (list start end))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cadr s))

;(define seg (make-segment (make-vect 0.0 0.0)
;                          (make-vect 1.0 1.0)))
;(start-segment seg)
;(end-segment seg)
