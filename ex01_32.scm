#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (next a)
  (+ a 1))

(define (term x)
  x)

(define (sum term a next b)
  (define (combiner-sum a b)
    (+ a b))
  (accumulate combiner-sum 0 term a next b))

(define (product term a next b)
  (define (combiner-product a b)
    (* a b))
  (accumulate combiner-product 1 term a next b))

(displayln (sum term 1 next 10))
(displayln (product term 1 next 10))
