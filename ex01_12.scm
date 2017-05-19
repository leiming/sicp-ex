#lang racket
(require racket/trace)
(require (planet neil/sicp))

(define (pascal-rec i j)
  (cond ((= 1 j) 1)
        ((= i j) 1)
        ((> j i) 0)
        (else (+ (pascal-rec (- i 1) j)
                 (pascal-rec (- i 1) (- j 1))))))

(display (pascal-rec 5 3))
(newline)

(display (pascal-rec 6 4))
(newline)
