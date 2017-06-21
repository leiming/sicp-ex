#lang sicp

(#%require racket/trace)

(define x (list (list 1 2) (list 3 4) (list 5 (list 6 7))))

x
(define (deep-reverse items)
  (define (deep-rev-if-required item)
    (if (not (pair? item)) ;;; leaf
        item
        (deep-reverse item)))
  (define (deep-rev-imp items result)
    (if (null? items)
        result
        (deep-rev-imp (cdr items)
                      (cons (deep-rev-if-required (car items))
                            result))))
  (deep-rev-imp items nil))

(deep-reverse x)
