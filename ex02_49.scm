#lang sicp

;;; https://docs.racket-lang.org/sicp-manual/
(#%require sicp-pict)

(define one 0.99) ; DrRacket 的 点1 在边缘无法绘出，用 0.99 代替
(define half 0.5)

(define tl (make-vect 0 one)) 
(define tr (make-vect one one)) 
(define bl (make-vect 0 0)) 
(define br (make-vect one 0))

(define t (make-vect half one))
(define r (make-vect one half))
(define l (make-vect 0 half))
(define b (make-vect half 0))

(define a_ (segments->painter 
            (list 
             (make-segment bl tl) 
             (make-segment tl tr) 
             (make-segment tr br) 
             (make-segment br bl))))

(define b_ (segments->painter
            (list
             (make-segment tl br)
             (make-segment tr bl))))

(define c_ (segments->painter
            (list
             (make-segment t r)
             (make-segment t l)
             (make-segment b r)
             (make-segment b l))))

(define wave
  (segments->painter
   (list
    (make-segment (make-vect 0.20 0.00) (make-vect 0.35 0.50))
    (make-segment (make-vect 0.35 0.50) (make-vect 0.30 0.60))
    (make-segment (make-vect 0.30 0.60) (make-vect 0.15 0.45))
    (make-segment (make-vect 0.15 0.45) (make-vect 0.00 0.60))
    (make-segment (make-vect 0.00 0.80) (make-vect 0.15 0.65))
    (make-segment (make-vect 0.15 0.65) (make-vect 0.30 0.70))
    (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
    (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
    (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
    (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
    (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
    (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
    (make-segment (make-vect 1.00 0.20) (make-vect 0.60 0.48))
    (make-segment (make-vect 0.60 0.48) (make-vect 0.80 0.00))
    (make-segment (make-vect 0.40 0.00) (make-vect 0.50 0.30))
    (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.00)))))

(paint a_)
(paint b_)
(paint c_)
(paint wave)
