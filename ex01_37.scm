#lang sicp

(define tolerance 0.0001)

(define (good-enough? a)
  (< (abs (- (/ 1 a) 1.6180)) tolerance))

;;; error 原因见 ex01_38.scm
(define (cont-frac-iter-wrong cont-n cont-d)
  (define (cont-frac-iter-proc cont-n cont-d n result)
    (let ((next-n (cont-n n))
          (next-d (cont-d n)))
      (if (good-enough? result)
          n
          ;;; 推导公式错误
          (cont-frac-iter-proc cont-n cont-d (+ n 1) (/ next-n (+ next-d result))))))
  (cont-frac-iter-proc cont-n cont-d 1 1.0))

;;; ---------------------

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (< i 1)
        result
        (iter (- i 1)
              (/ (n i)
                 (+ (d i) result)))))
  (iter k 1))

(cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                12)

;;; ----------------------------

(define (cont-frac-rec cont-n cont-d k)
  (let ((next-n (cont-n k))
        (next-d (cont-d k)))
    (if (= k 1)
        (/ next-n next-d)
        (/ next-n (+ next-d (cont-frac-rec cont-n cont-d (- k 1)))))))

(* 1.618 (cont-frac-rec (lambda (i) 1.0)
                        (lambda (i) 1.0)
                        11))
