#lang sicp
(#%require racket/trace)
(#%require racket/base)

(define (square x) (* x x))

(define (fast-expt-iter b a n)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) a (/ n 2)))
        (else (fast-expt-iter b (* a b) (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter b 1 n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (slow-expmod base exp m)
  (remainder (fast-expt base exp) m))

(trace square)
(trace fast-expt)

;(displayln (fermat-test 1000000007))
(displayln (slow-expmod 5 101 101))

;;; >(fast-expt 5 101)
;;; > (square 5)
;;; < 25
;;; > (square 25)
;;; < 625
;;; > (square 625)
;;; < 390625
;;; > (square 390625)
;;; < 152587890625
;;; > (square 152587890625)
;;; < 23283064365386962890625
;;; > (square 23283064365386962890625)
;;; < 542101086242752217003726400434970855712890625
;;; <39443045261050590270586428264139311483660321755451150238513946533203125
;;; 5

;;; ----------------------------------------------

;;; Alyssa 的 expmod 函数在理论上是没有错的，但是在实际中却运行得不好。
;;;
;;; 因为费马检查在对一个非常大的数进行素数检测的时候，可能需要计算一个很大的乘幂，
;;; 比如说，求十亿的一亿次方，这种非常大的数值计算的速度非常慢，而且很容易因为超出实现的限制而造成溢出。
;;;
;;; 而书本 34 页的 expmod 函数，通过每次对乘幂进行 remainder 操作，从而将乘幂限制在一个
;;; 很小的范围内（不超过参数 m ），这样可以最大限度地避免溢出，而且计算速度快得多。
