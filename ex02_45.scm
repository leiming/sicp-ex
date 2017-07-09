#lang sicp

(#%require sicp-pict)
(define p einstein)

(define (split first second)
  (define (split-inner painter n)
    (if (= n 0)
      painter
      (let ((smaller (split-inner painter (- n 1))))
        (first painter (second smaller smaller)))))
  split-inner)

(define up-split (split below  beside))

(paint (up-split p 2))