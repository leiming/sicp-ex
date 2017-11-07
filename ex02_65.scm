#lang racket

(require (rename-in "ex02_61.scm"
                    (intersection-set intersection-set-list)));;; intersection-set
(require (rename-in "ex02_62.scm"
                    (union-set union-set-list)));;; union-set
(require "ex02_63.scm") ;;; tree->list
(require "ex02_64.scm") ;;; list->tree

(define (union-set tree1 tree2)
  (list->tree (union-set-list (tree->list tree1)
                              (tree->list tree2))))
  
  
(define (intersection-set tree1 tree2)
  (list->tree (intersection-set-list (tree->list tree1)
                                     (tree->list tree2))))

;(union-set (list->tree '(1 3 5 9 10)) (list->tree '(2 4 5 7)))
;(intersection-set (list->tree '(1 3 5 9 10)) (list->tree '(2 4 5 7)))
