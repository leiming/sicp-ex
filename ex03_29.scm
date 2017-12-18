#lang sicp

(#%require "ex03_31.scm")
(#%require "ex03_32.scm")

(define (and-gate a1 a2 output)
  output)

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  (newline)
  'OK)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else
          (error "Invalid signal" s))))


;;; ----------------------------------

(define input-1 (make-wire))
(define input-2 (make-wire))
(define not-line (make-wire))
(define sum (make-wire))
(define carry (make-wire))

(probe 'not-line not-line)
(probe 'input-1 input-1)

(inverter input-1 not-line)
(propagate)

(set-signal! input-1 1)
(propagate)
