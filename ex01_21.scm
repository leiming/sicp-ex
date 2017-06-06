#lang sicp
(#%require racket/trace)
(#%require racket/base)

(define (square x) (* x x))

(define (smallest-divisior n)
  (fast-find-divisior n 2))

(define (devides? a b)
  (= (remainder a b) 0))

(define (find-divisior n test-devisior)
  (cond ((> test-devisior n) n)
        ((devides? n test-devisior) test-devisior)
        (else (find-divisior n (+ 1 test-devisior)))))

(define (fast-find-divisior n test-devisior)
  (cond ((> (square test-devisior) n) n)
        ((devides? n test-devisior) test-devisior)
        (else (fast-find-divisior n (+ 1 test-devisior)))))

;(trace devides?)
;(trace find-divisior)

(displayln (smallest-divisior 31))
(displayln (smallest-divisior 199))
(displayln (smallest-divisior 1999))
(displayln (smallest-divisior 19999))
