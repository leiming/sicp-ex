#lang sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define m (make-mobile (make-branch 10 (make-branch 2 3)) (make-branch 12 3)))

(define (total-branch-weight branch)
  (let ((length (branch-length branch))
        (structure (branch-structure branch)))
    (if (pair? structure)
        (+ length (total-branch-weight structure))
        (+ length structure))))

(define (total-weight mobile)
  (+ (total-branch-weight (left-branch mobile)) (total-branch-weight (right-branch mobile))))

(define (balance mobile)
  (= (total-branch-weight (left-branch mobile)) (total-branch-weight (right-branch mobile))))

; (total-weight m)
; (balance m)
