#lang sicp

;(#%require racket/trace)

(define (count-pairs x)
    (length (inner x '())))

(define (inner x memo-list)
    (if (and (pair? x)
             (eq? (memq x memo-list) #f))
        (inner (car x)
               (inner (cdr x)
                      (cons x memo-list)))
        memo-list))

;; 对比ex03_16,学会这个递归转迭代的技巧

(define y1 (cons 1 1))
(define y2 (cons 2 2))
(define y3 (cons y1 y2))
(count-pairs y3)
;;; 3

(define w1 (cons 1 1))
(define w2 (cons w1 2))
(define w3 (cons w2 w1))
(count-pairs w3)
;;; 4

(define x1 (cons 1 1))
(define x2 (cons x1 2))
(define x3 (cons x2 x2))
(count-pairs x3)
;;; 5

(define z1 (cons 1 1))
(define z2 (cons z1 z1))
(define z3 (cons z2 z2))
(count-pairs z3)


(count-pairs (let ((x (cons 1 2)))    ; 带有重复指针的序对
               (cons x x)))
