#lang sicp

(define (func1 f)
  (+ (f 0) (f 1)))

(define (func2 f)
  (+ (f 1) (f 0)))

(define f
  (let ((called #f))
    (lambda (x)
      (if (and (= x 0) (eq? called #f))
          (begin (set! called #t)
            -1)
          x))))

(func1 f)
(func2 f)
