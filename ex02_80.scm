#lang racket

;;; =zero?
(require "ex02_75.scm")

;;; make-complex-from-real-imag
;;; make-complex-from-mag-ang
(require "ex02_76.scm")

;;; make-rational
(require "ex02_77.scm")

;;; make-scheme-number
(require "ex02_78.scm")

(=zero? (make-scheme-number 0))
(=zero? (make-scheme-number 1))

(=zero? (make-rational 0 2))
(=zero? (make-rational 1 2))

(=zero? (make-complex-from-real-imag 0 0))
(=zero? (make-complex-from-real-imag 1 0))
