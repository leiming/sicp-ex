#lang sicp
(#%require racket/trace)
(#%require racket/base)

(define (square x ) (* x x))

(define (expmod base exp m)
  (define (trivial-square-test a n)
    (if (and (not (= a 1))
             (not (= a (- n 1)))
             (= 1 (remainder (square a) n)))
        0
        a))

  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (trivial-square-test (expmod base (/ exp 2) m)
                                                 m))
                    m))
        (else
         (remainder (* base (trivial-square-test (expmod base (- exp 1) m)
                                                 m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))


(define (miller-rabin-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n) (miller-rabin-prime? n (- times 1)))
        (else #f)))
;
(trace expmod)
(displayln (miller-rabin-prime? 561 5))
(displayln (miller-rabin-prime? 11 5))
