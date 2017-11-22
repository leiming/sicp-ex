#lang sicp

(define (prev-ptr item)
  (cdar item))

(define (next-ptr item)
  (cdr item))

(define (set-prev-ptr! node ptr)
  (set-cdr! (car node) ptr))

(define (set-next-ptr! node ptr)
  (set-cdr! node ptr))

(define ccc (cons (cons 1 2) 3))
(prev-ptr ccc)
