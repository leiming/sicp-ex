#lang racket

; 思路:
; 迭代递归，传入 三个值
; 判断第二个值，符号
; 若是乘号，加括号，返回
; 继续遍历 
; 晚安 ~

(define (add-brace expression)
  (define (add-brace-iter before exp after)
    ;(displayln before)
    ;(displayln exp)
    ;(displayln after)
    ;(displayln "--------------")
    (let ((s1 (car exp))
          (oper (cadr exp)))
      (cond ((empty? (cdr after)) (append before (list (append exp after)))) ;; 除了空值判断以外，加符号判断
            ((eq? oper '+)
             (add-brace-iter (append before exp) (list (car after) (cadr after)) (cddr after)))
            ((eq? oper '*)
             (add-brace-iter before (list (append exp (list (car after))) (cadr after)) (cddr after)))
            (else
              (error "111")))))
  (add-brace-iter '() (list (car expression) (cadr expression)) (cddr expression)))

(add-brace (list 1 '+ 2 '* 3 '+ 4 '* 5 '+ 6))
; '(1 + (2 * 3) + (4 * 5) + 6)
(add-brace (list 1 '+ 2 '* 3 '* 4 '* 5 '+ 6))
; '(1 + (((2 * 3) * 4) * 5) + 6)
(add-brace (list 1 '+ 2 '* 3 '* 4 '* 5 '* 6))
; '(1 + ((((2 * 3) * 4) * 5) * 6))
(add-brace (list 1 '* 2 '* 3 '* 4 '* 5 '+ 6))
; '((((((1 * 2) * 3) * 4) * 5) + 6)) 这个多一层括号，再改，晚安 
