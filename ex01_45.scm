#lang sicp

(#%require "ex01_40.scm")
(#%require "ex01_43.scm")

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2.0))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define (average-damp-n-times f n)
  ((repeated average-damp n) f))

(define (pow base n)
  (if (= n 0)
      1
      ((repeated (lambda (x) (* base x)) n) 1)))

;;; 求指数取整
;;; 收敛条件 http://sicp.readthedocs.io/en/latest/chp1/45.html
;;; 通过统计测出，需要 log2 N 次平均阻尼
(define (log base n)
  (define (iter p r)
    (if (< (- n r) 0)
        (- p 1)
        (iter (+ p 1) (* r base))))
  (iter 1 2))

(define (nth-root n x)
  (fixed-point (average-damp-n-times
                  (lambda (y) (/ x (pow y (- n 1))))
                  (log 2 n))
               1.0))

(nth-root 5 32)
