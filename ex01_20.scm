#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define % remainder)

(define (my-gcd a b)
  (if (= b 0)
    a
    (my-gcd b (% a b))))

(trace my-gcd)
(trace %)

(displayln (my-gcd 206 40))

; http://community.schemewiki.org/?sicp-ex-1.20
