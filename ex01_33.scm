#lang racket
(require (planet neil/sicp))
(require racket/trace)
(require "ex01_23.scm")

(define (next a)
  (+ a 1))

(define (term x)
  x)

(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (combiner
          (if (filter a)
            (term a)
            null-value)
          (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-prime term a next b)
  (filtered-accumulate + 0 term a next b prime?))

(define (product-gcd term a next b)
  (define (gcd-filter a)
    (= 1 (gcd a b)))
  (filtered-accumulate * 1 term a next b gcd-filter))

(displayln (sum-prime term 1 next 10))
(displayln (product-gcd term 1 next 10))
