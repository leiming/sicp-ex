#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (cube x)
  (* x x x))

(define (sum term k next n)
  (if (> k n)
      0
      (+ (term k)
         (sum term (next k) next n))))

(define (integral f k a b n)
  (define (func-h a b n)
    (/ (- b a) n))
  (define (func-y k)
    (f (+ a (* k (func-h a b n)))))
  ;;; 系数
  (define (coefficient a)
    (cond ((or (= a n) (= a 0)) 1)
          ((odd? a) 4)
          (else 2)))

  (define (next-k k)
    (+ k 1))
  ;;; 项数
  (define (item k)
    (* (coefficient k) (func-y k)))

  (* (/ (func-h a b n) 3) (sum item k next-k n)))

(define (integral-simpson f a b n)
  (integral f 0 a b n))

(displayln (integral-simpson cube 0 1.0 100))
(displayln (integral-simpson cube 0 1.0 1000))
