#lang sicp
;
(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons (square (car things))
                  answer))))
  (iter items nil))

(list 1 2 3)

(square-list (list 1 2 3))
; (mcons 9 (mcons 4 (mcons 1)))

(define (square-list-two items)
  (define (iter things answer)
    (if (null? things)
      answer
      (iter (cdr things)
            (cons answer
                  (square (car things))))))
  (iter items nil))

(square-list-two (list 1 2 3))
; (mcons (mcons (mcons '() 1) 4) 9)

(define (square-list-iter items)
    (define (iter things answer)
        (if (null? things)
            (reverse answer) ; 修改
            (iter (cdr things)
                  (cons (square (car things))
                        answer))))
    (iter items nil))

(square-list-iter (list 1 2 3))
