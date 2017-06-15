#lang sicp

(define (square x) (* x x))

(define (tan-cf x k)
  (define (tan n d k)
    (define (iter i result)
      (if (< i 1)
          result
          (iter (- i 1)
                (/ (n i)
                   (+ (d i) result)))))
    (iter k 0.5))
  (tan (lambda (n)
          (if (= n 1)
              x
              (- (square x))))
       (lambda (n)
          (- (* n 2) 1))
       k))

(define (radian angle)
  (define PI 3.1415926535897932384626)
  (/ (* angle PI ) 180))


(tan-cf (radian 45) 10000)
(tan (radian 45))
