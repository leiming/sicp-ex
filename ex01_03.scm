#lang racket
(require racket/trace)
(require (planet neil/sicp))

(define (square x )(* x x))

(define (sum_square x y)
  (+ (square x) (square y)))


(define (max_sum_square x y z)
  (if(> x y)
    (if (> y z)
      (sum_square x y)
      (sum_square x z))

    (if (> x z)
      (sum_square x y)
      (sum_square y z))))

  
(display(max_sum_square 1 2 3))
(newline)
(display(max_sum_square 2 1 3))
(newline)
(display(max_sum_square 2 3 1))
(newline)
