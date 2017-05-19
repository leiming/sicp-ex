#lang racket
(require racket/trace)
(require (planet neil/sicp))

(define (fib-recur n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recur (- n 1))
                 (fib-recur (- n 2))))))
                 
;(trace fib-recur)
(display (fib-recur 6))
(newline)

(define (fib-iter n)
  (define (iter a b count)
    (if (= count 0)
        b
        (iter (+ a b) a (- count 1))))

 ;(trace iter)
 (iter 1 0 n))


(display (fib-iter 6))
