#lang sicp

(#%require "ex01_41.scm")
(#%provide compose square)

(define (compose f g)
  (lambda (x)
    (f (g x))))

;;; ((compose square inc) 6)
; 49
