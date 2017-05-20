#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (square n) (* n n))

;(define (even? n)
  ;(= (remainder n 2) 0))

(define (fast-expt-iter b a n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) a (/ n 2)))
        (else (fast-expt-iter b (* a b) (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter b 1 n))

(displayln (fast-expt 2 10))
(displayln (fast-expt 2 20))
