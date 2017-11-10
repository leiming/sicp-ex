#lang racket

;;; =zero?
(require "ex03_24.scm")
(require "ex02_75.scm")

;;; make-scheme-number
(require "ex02_78.scm")

;;; install-polynomial-package
(require "ex02_87.scm")

(define one-terms
  (list (make-term 4 5)
        (make-term 2 3)
        (make-term 1 0)))

(define two-terms
  (list (make-term 5 1)
        (make-term 4 1)
        (make-term 1 3)))

;(nagative (make-polynomial 'x one-terms))

(add (make-polynomial 'x one-terms)
     (make-polynomial 'x two-terms))

(sub (make-polynomial 'x one-terms)
     (make-polynomial 'x two-terms))
