#lang racket

;;; equ?
(require "ex02_75.scm")

;;; make-complex-from-real-imag
;;; make-complex-from-mag-ang
(require "ex02_76.scm")

;;; make-rational
(require "ex02_77.scm")

;;; make-scheme-number
(require "ex02_78.scm")

(equ? (make-scheme-number 10)
      (make-scheme-number 10))

(equ? (make-rational 3 5)
      (make-rational 6 10))

(equ? (make-complex-from-real-imag 3 5)
      (make-complex-from-real-imag 6 10))
