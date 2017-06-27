#lang sicp

(#%require "ex02_38.scm")

(define (reverse-r sequence)
  (fold-right (lambda (x y)
                    (append y (list x))) 
              nil sequence))
; x y
; 3 '()
; 2 (3)
; 1 (3 2)
; (3 2 1)
(reverse-r (list 1 (list 2 3) (list 4 5) 6))

(define (reverse-l sequence)
;  ;(fold-left (lambda (x y) (append (list y) x)) nil sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))
;  
(reverse-l (list 1 (list 2 3) (list 4 5) 6))
