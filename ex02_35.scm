#lang sicp

(#%require "ex02_33.scm") ;;; accumulate

(define x (list 1 (list 7 11 9 (list 2 3)) 3 4 5 6))

(define (count-leave t)
  (accumulate (lambda (x y) (+ x y)) 0 (map (lambda (x) 
                                                (cond ((null? x) nil)
                                                      ((not (pair? x)) 1)
                                                      (else (count-leave x))))
                                        t)))                                                         
  
(count-leave x)