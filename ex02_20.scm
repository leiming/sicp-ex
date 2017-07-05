#lang sicp
;(#%require racket/trace)

(#%provide filter)

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence) 
               (filter predicate (cdr sequence))))
        (else
         (filter predicate (cdr sequence)))))

;(trace filter)

(define (same-parity . args)
  (if (even? (car args))
      (filter even? args)
      (filter odd? args)))

;(same-parity 1 3 4 5 6 7 8 9)
;(same-parity 2 3 4 5 6 7 8 9)
