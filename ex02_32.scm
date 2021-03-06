#lang racket

(#%require racket/trace)

(define nil '())

(define t (list 1 2 3))

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (cons (car s) x)) rest)))))

(trace subsets)

(subsets t)

;(subsets '(1 2 3))
;rest ← (subsets '(2 3))
;       rest ← (subsets '(3))
;              rest ← (subsets '())
;                     '(())
;              (append '(()) (map ⟨…⟩ '(())))
;              '(() (3))
;       (append '(() (3)) (map ⟨…⟩ '(() (3))))
;       '(() (3) (2) (2 3))
;(append '(() (3) (2) (2 3)) (map ⟨…⟩ '(() (3) (2) (2 3))))
;'(() (3) (2) (2 3) (1) (1 3) (1 2) (1 2 3))
