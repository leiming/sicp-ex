#lang racket

(define (=number? exp num)
  (and (number? exp)
       (= exp num)))

(define (variable? x)
  (symbol? x))

(define (same-variable? x y)
  (and (variable? x) (variable? y) (eq? x y)))

;; ----------------------------

(define (sum? x)
  (and (pair? x) (eq? (cadr x) '+)))
(define (addend s) (car s))
(define (augend s) (caddr s))

(define (make-sum a1 a2) 
  (cond ((=number? a1 0) a2) 
        ((=number? a2 0) a1) 
        ((and (number? a1) (number? a2)) (+ a1 a2)) 
        (else (list a1 '+ a2)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (product? x)
  (and (pair? x) (eq? (cadr x) '*)))

(define (multiplier p) (car p))

(define (multiplicand p) (caddr p))

(define (make-product m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
        ((=number? m1 1) m2) 
        ((=number? m2 1) m1) 
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        (else (list m1 '* m2))))

;;;;;;;;;;;;;;;;;;

(define (make-expression-params-3 l) ; 计算3个参数的简单表达式
  (cond ((product? l)
         (make-product (multiplier l) (multiplicand l)))
        ((sum? l)
         (make-sum (addend l) (augend l)))
        (else
         (error "not expression --" l))))


(define (make-expression-params-5 l) ; 计算5个参数的复杂表达式
  (let ((para-1 (car l))
        (oper-1 (cadr l))
        (para-2 (caddr l))
        (oper-2 (cadddr l))
        (para-3 (car (cddddr l))))
    (cond ((eq? oper-2 '*)
           (make-expression-params-3 (list para-1 
                                           oper-1 
                                           (make-expression-params-3 (list para-2
                                                                           oper-2
                                                                           para-3)))))
          ((eq? oper-2 '+)
           (make-expression-params-3 (list (make-expression-params-3 (list para-1
                                                                           oper-1
                                                                           para-2))
                                           oper-2
                                           para-3)))
          (else 
           (error "not expression --" l)))))
;;; 计算式构造函数

(define (make-expression l)
  (let ((exp-length (length l)))
    (cond ((= exp-length 3) 
           (make-expression-params-3 l))
          ((= exp-length 5)
           (make-expression-params-5 l))
          (else ;;; 先计算前三个
           (make-expression (cons (make-expression-params-3 (list (car l) (cadr l) (caddr l)))
                                  (cdddr l)))))))


; (make-expression (list 'x '+ 3)) ;'(x + 3)
; (make-expression (list 'x '* 3)) ;'(x * 3)
; (make-expression (list  2 '* 3)) ; 3
; (make-expression (list 1 '+ 3 '+ 'x)) ;'(4 + x)
; (make-expression (list 1 '+ 'x '* 5)) ;'(1 + (x * 5))
; (make-expression (list 1 '+ 3  '* 5)) ;16

;;; error 错误算法，留底
;;; 超过多项后，先合并前3项的算法是不可取的
;;; 无法避免未遍历的那个符号「例如向前遍历的第二个符号，或向后遍历的第一个符号是乘号的情况」
(make-expression (list 1 '+ 'x '* 5 '+ 7)) ; '(((1 + x) * 5) + 7)
