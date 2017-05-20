#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (halve a)
  (/ a 2))

(define (double a)
  (* a 2))

(define (fast-multiple-rec a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-multiple-rec (double a) (halve b)))
        (else (+ a (fast-multiple-rec a (- b 1))))))

(trace fast-multiple-rec)
(displayln (fast-multiple-rec 2 15))
