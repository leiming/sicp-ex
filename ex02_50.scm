#lang sicp

;;; https://docs.racket-lang.org/sicp-manual/
(#%require sicp-pict)

(define one 0.99)
(define tl (make-vect 0 one)) 
(define tr (make-vect one one)) 
(define bl (make-vect 0 0)) 
(define br (make-vect one 0))

(define a (segments->painter 
           (list 
            (make-segment bl tl) 
            (make-segment tl tr) 
            (make-segment tr br) 
            (make-segment br bl)))) 
