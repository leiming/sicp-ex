#lang sicp

(#%provide gcd)

(define % remainder)

(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (% a b))))

;(gcd 206 40)
; http://community.schemewiki.org/?sicp-ex-1.20
