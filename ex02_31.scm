#lang sicp

;;; same as ex02_30.scm

(define (square x) (* x x))

(define t (list 1 (list 2 3 (list 4 5) 6) 7))

(define (map-tree-map tree f)
  (map (lambda (sub-tree)
          (if (pair? sub-tree)
              (map-tree-map sub-tree f)
              (f sub-tree)))
       tree))

(define (square-tree-map tree)
   (map-tree-map tree square))

(define (map-tree-normal tree f)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (f tree))
        (else
          (cons (map-tree-normal (car tree) f)
                (map-tree-normal (cdr tree) f)))))

(define (square-tree-normal tree)
  (map-tree-normal tree square))

(square-tree-map t)
(square-tree-normal t)
