#lang sicp

(define (cont-d i)
  (let ((n (floor (/ (+ i 1) 3))))
    (if (= 0 (remainder (+ i 1) 3))
      (* 2 n)
      1)))

(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 1))

;;; wrong
(define (cont-frac-iter n d k)
  (define (iter i result)
      (if (= k i)
          result
          (iter (+ i 1)
                (/ (n i)
                   (+ (d i) result)))))
  (iter 1 2))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           30000)

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                30000)


(cont-frac (lambda (i) 1.0)
           cont-d
           30000)

(cont-frac-iter (lambda (i) 1.0)
                cont-d
                30000)

;;; cont-frac-iter 的结果错误的原因是：推导公式错误
;;; 连分式 f(k) 的计算，依赖 f(k+1) 的运算结果
;;; 更详细地：f(1) 的层的结果的分母为 f(2) 与 D1 的和
;;; 因此，要再迭代计算中获取 f(2) ，需要先计算出 f(1) 的值

;;; result
; 0.6180339887498948
; 0.6180339887498948
; 0.7182818284590453
; 4.999874999999922e-05
