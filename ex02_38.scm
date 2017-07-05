#lang sicp

(#%provide fold-right fold-left accumulate)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)
  
(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(fold-right / 1 (list 1 2 3))
; (/ 1 (fold-right / 1 (list 2 3)))
; (/ 1 (/ 2 (fold-right / 1 (list 3))))
; (/ 1 (/ 2 (/ 3 (fold-right / 1 nil))))
; (/ 1 (/ 2 (/ 3 1)))
; (/ 3 2)

;(fold-left / 1 (list 1 2 3))
; (iter 1 (list 1 2 3))
; (iter (/ (/ 1 1) 1) (list 2 3))
; (iter (/ (/ 1 1) 2) (list 3)
; (iter (/ (/ (/ 1 1) 2) 3) nil)
; (/ (/ (/ 1 1) 2) 3)
; (/ 1 6)

;(fold-right list '() (list 1 2 3))
; (list 1 (list 2 (list 3 nil)))
; (mcons 1 (mcons (mcons 2 (mcons (mcons 3 (mcons '()))))))
; '(1 (2 (3 ())))

;(fold-left list '() (list 1 2 3))
; (list (list (list '() 1) 2) 3)
; (mcons (mcons (mcons '() (mcons 1)) (mcons 2)) (mcons 3))
; '(((() 1) 2) 3)