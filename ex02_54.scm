#lang sicp

(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b))) (eq? a b))
        ((and (pair? a) (pair? b)) (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))
        (else 
          #f)))

(equal? 1 1)
(equal? 1 (list 1))
(equal? '() '())
(equal? '() '(a))
(equal? '(1 2) '(1 2))
(equal? '(1 2) '(1 2 3))
(equal? '(1 '(2) 3) '(1 '(2) 3))
(equal? '(1 '(2) 3) '(1 '(2 3) 3))
(equal? nil nil)
