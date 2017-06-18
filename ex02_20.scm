#lang sicp
;(#%require racket/trace)

(define (filter l g)
  (cond ((null? l) nil)
        ((g (car l))
         (cons (car l) (filter (cdr l) g)))
        (else
         (filter (cdr l) g))))

;(trace filter)

(define (same-parity . args)
  (if (even? (car args))
      (filter args even?)
      (filter args odd?)))

(same-parity 1 3 4 5 6 7 8 9)
(same-parity 2 3 4 5 6 7 8 9)
