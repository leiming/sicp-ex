#lang racket
(require racket/trace)
(require (planet neil/sicp))

(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))
  
;;; 正则式
;;; (test 0 (p)) =>
;;; (if (= 0 0) 0 (p)) =>
;;; 0

;;; 应用式
;;; (define (p) (p))
;;; 无限递归调用，直接死机
