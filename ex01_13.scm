#lang racket
(require racket/trace)
(require (planet neil/sicp))
;;; Numbers wiki
;;; http://www.gnu.org/software/mit-scheme/documentation/mit-scheme-ref/Numerical-operations.html


; (1) 将 (- (fib n) (+ (fib (- n 1)) (fib (- n 2)))) 用证明公式迭代计算，轻易可证等于0

(define (psi)
  (/ (- 1 (sqrt 5)) 2))

(define (phi)
  (/ (+ 1 (sqrt 5)) 2))

(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(define (diff count)
  (- (* (fib count) (sqrt 5))
     (+ (expt (psi) count) (expt (phi) count))))

(display (diff 13))
(newline)
;;; .0038387574508078615

(display (diff 14))
(newline)
;;; -.0023724825796307414

; -------------------------
(display  (psi))

; (2) 因为 psi == -.6180 ，所以count --> 无穷大时， (expt (psi) count) --> 0
;     则 (+ (expt (psi) count) (expt (phi) count)) --> (expt (phi) count) ，
;     无限接近 (* (fib count) (sqrt 5)
