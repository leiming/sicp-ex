#lang sicp
(#%require racket/trace)
(#%require racket/base)

(define (% n m)
  (remainder n m))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp) (% (* (expmod base (/ exp 2) m)
                           (expmod base (/ exp 2) m))
                      m))
        (else
          (% (* base (expmod base (- exp 1) m)) m))))


(trace %)
(displayln (expmod 5 12 12))
