#lang sicp 

(list 1 2 3)
; (mcons 1 (mcons 2 (mcons 3 '())))

(list 1 (list 2 (list 3)))
; (mcons 1 (mcons (mcons 2 (mcons (mcons 3 '()) '())) '()))

(list 'a 'b 'c)
; (mcons 'a (mcons 'b (mcons 'c '())))

(list (list 'george))
; (mcons (mcons 'george '()) '())

(cdr '((x1 x2) (y1 y2)))
; (mcons (mcons 'y1 (mcons 'y2 '())) '())

(pair? (car '(a short list)))
; #f

(car '(a short list))
; 'a

(memq 'red '((red shoes) (blue socks)))
; #f

(memq 'red '(red shoes blue socks))
; (mcons 'red (mcons 'shoes (mcons 'blue (mcons 'socks '()))))
