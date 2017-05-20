#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (halve a)
  (/ a 2))

(define (double a)
  (* a 2))

(define (fast-multiple-iter a b n)
  (cond ((= b 1) (+ a n))
        ((even? b) (fast-multiple-iter (double a) (halve b) n))
        (else (fast-multiple-iter a (- b 1) (+ a n)))))

(trace fast-multiple-iter)

(define (fast-multiple a b)
  (fast-multiple-iter a b 0))

;(provide fast-multiple)

(displayln (fast-multiple 2 15))
