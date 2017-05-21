#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test? n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (next-odd m)
  (if (odd? m) (+ 2 m)
               (+ 1 m)))

(define (carmichael? m)
  (carmichael-test m 1))

(define (carmichael-test m a)
  (cond ((= (next-odd a) m) #t)
        ((fermat-test m (next-odd a))
         (carmichael-test m (next-odd a)))
        (else #f)))

(displayln (carmichael? 561))
(displayln (carmichael? 1105))
