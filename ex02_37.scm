#lang sicp

(#%require "ex02_36.scm")

(define m (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
(define v (list 1 2 3 4))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;;; 向量 乘 向量
;(dot-product (list 1 2 3) (list 4 5 6))
;;; (1 2 3) x (4 5 6)
;;; (+ (* 1 4) (* 2 5) (* 3 6))

;;; 矩阵 乘 向量
(define (martix-*-vector m v)
  (map (lambda (x) (dot-product x v))
       m))

;(martix-*-vector m v)
;;; (list (1 2 3 4) x (1 2 3 4)
;;;       (5 6 7 8) x (1 2 3 4)
;;;       (9 10 11 12) x (1 2 3 4)) 

;;; http://www.360docs.net/doc/info-bed8496bee06eff9aef8077f.html

;;; 矩阵转置
(define (transpose mat)
  (accumulate-n cons nil mat))

;(transpose m)  
;;; ( (1 5 9) (2 6 10) ... )

(define (martix-*-martix m n)
  (let ((cols (transpose n)))
    (map (lambda (x) (martix-*-vector cols x)) m)))

(define k (list (list 1 2) (list 3 4)))
;(martix-*-martix k k)
;;; (mcons (mcons 7 (mcons 10)) (mcons (mcons 15 (mcons 22))))
