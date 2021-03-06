#lang racket
(require racket/trace)
(require (planet neil/sicp))

;;; page 26
;;; Example: Counting change

(define (charge-coin amount coin-type)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= coin-type 0)) 0)
        (else (+ (charge-coin amount
                              (- coin-type 1))
                 (charge-coin (- amount
                                 (coin-type-conf coin-type))
                              coin-type)))))

(trace charge-coin)

(define (coin-type-conf coin-type)
  (cond ((= coin-type 1) 1)
        ((= coin-type 2) 5)
        ((= coin-type 3) 10)
        ((= coin-type 4) 25)
        ((= coin-type 5) 50)))

(define (count-change amount)
  (charge-coin amount 5))

;(display (count-change 60))
;;; 292
(newline)
(display (count-change 10))
;;; 4

;;; https://github.com/jiacai2050/sicp/blob/master/exercises/01/1.14.md
;;; http://sicp.readthedocs.org/en/latest/_images/14.pngz

;;; https://github.com/jiacai2050/sicp/blob/master/05/2015-05-21-count-change-recurisve.md
