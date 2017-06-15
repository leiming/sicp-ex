#lang sicp

(#%require "ex01_42.scm")

(#%provide repeated)

(define (repeated-not-use-compose f n)
  (lambda (x)
    (define (repeat-process v k)
      (let ((value (f v)))
           (if (= k 1)
               value
               (repeat-process value (- k 1)))))
    (repeat-process x n)))

(define (repeated-not-good f n)
  (define (repeat-process g k)
    (if (= k 1)
        (lambda (x)
          (g x))
        (repeat-process (compose f g) (- k 1))))
  (lambda (x)
    ((repeat-process f n) x)))

(define (repeat f n)
  (if (< n 1)
      (lambda (x) x)
      (compose f (repeat f (- n 1)))))

(define (repeated f n)
  (cond ((= n 0) identity)
        ((even? n) (repeated (compose f f) (/ n 2)))
        (else (compose f (repeated f (- n 1))))))

;((repeated-not-use-compose square 3) 5)
;((repeated-not-good square 3) 5)
;((repeat square 3) 5)
;((repeated square 3) 5)
