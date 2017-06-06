#lang sicp
(#%require racket/trace)
(#%require racket/base)

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (define (factorial-tern n)
    n)
  (product factorial-tern 1 next-k n))

(define (next-k k)
  (+ k 1))

(define (product-term n)
  (define (next-odd n)
    (if (odd? n)
        (+ n 2)
        (+ n 1)))
  (define (next-even n)
    (if (even? n)
        (+ n 2)
        (+ n 1)))
  (/ (next-even n) (next-odd n)))

(define (Pi x)
  (* 4 (product product-term 1.0 next-k x)))

(displayln (factorial 9))
(displayln (Pi 10000))
