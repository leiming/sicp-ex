#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(displayln (fib 10))

; p' = (+ (* p p) (* q q))
; q' = (+ (* q q) (* 2 p q))
; 证明过程见 ./assets/ex01_19_1.jpeg

(define (fast-fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count) (fast-fib-iter a
                                      b
                                      (+ (* p p) (* q q))
                                      (+ (* q q) (* 2 p q))
                                      (/ count 2)))
        (else (fast-fib-iter  (+ (* b q) (* a q) (* a p))
                              (+ (* b p) (* a q))
                              p
                              q
                              (- count 1)))))

(define (fast-fib n)
  (fast-fib-iter 1 0 0 1 n))

(displayln (fast-fib 10))
