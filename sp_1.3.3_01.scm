#lang sicp
(#%require racket/base)

(define (average x y)
  (/ (+ x y) 2.0))

(define (search f neg-point pos-point)
  (let ((mid-point (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
      mid-point
      (let ((test-value (f mid-point)))
        (cond ((positive? test-value)
               (search f neg-point mid-point))
              ((negative? test-value)
               (search f mid-point pos-point))
              (else
                mid-point))))))

(define (close-enough? neg-point pos-point)
  (< (abs (- neg-point pos-point)) 0.001))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negative? a-value) (positive? b-value))
           (search f a b))
          ((and (positive? a-value) (negative? b-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(half-interval-method sin 3 4)
