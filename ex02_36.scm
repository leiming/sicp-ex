#lang sicp

(#%require "ex02_33.scm") ;;; accumulate

(#%provide 
  accumulate
  accumulate-n)

(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))

;(map car s)
;(map cdr s)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;;; (accumulate-n + 0 s)
;;; (mcons 22 (mcons 26 (mcons 30)))

;;; http://sicp.readthedocs.io/en/latest/chp2/36.html