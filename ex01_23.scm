#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (square x) (* x x))

(define (smallest-divisior n)
  (fast-find-divisior n 2))

(define (devides? a b)
  (= (remainder a b) 0))

(define (fast-find-divisior n test-devisior)
  (cond ((> (square test-devisior) n) n)
        ((devides? n test-devisior) test-devisior)
        (else (fast-find-divisior n (next-odd test-devisior)))))

(define (next-odd n)
  (if (even? n) (+ 1 n)
                (+ 2 n)))

(define (prime? n)
  (= (smallest-divisior n) n))

(provide prime?)

;(displayln (smallest-divisior 31))
;(displayln (smallest-divisior 199))
;(displayln (smallest-divisior 1999))
;(displayln (smallest-divisior 19999))
