#lang sicp

(define x (list (list 1 2) (list 3 4) (list 5 (list 6 7))))

(define (fringe-rec tree)
  (define nil '())
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (fringe-rec (car tree)) (fringe-rec (cdr tree))))))

(define (fringe items)
  (define (fringe-iter items result)
    (cond ((null? items) result)
          ((not (pair? items))
           (cons items result))
          (else
           (fringe-iter (car items) (fringe-iter (cdr items) result)))))
  (fringe-iter items nil))

(fringe-rec x)
(fringe x)
