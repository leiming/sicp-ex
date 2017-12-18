#lang sicp

(#%require "ex03_31.scm")
(#%require "ex03_32.scm")

(define (and-gate a1 a2 output)
  (define (and-action-procedure)
    (let ((new-value
            (logical-and (get-signal a1) (get-signal a2))))
      (after-delay and-gate-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! a1 and-action-procedure)
  (add-action! a2 and-action-procedure)
  (newline)
  'OK)

(define (logical-and a1 a2)
  (cond ((and (= a1 1) (= a2 1)) 1)
        (else 0)))

(define (inverter input output)
  (define (invert-input)
    (let ((new-value (logical-not (get-signal input))))
      (after-delay inverter-delay
                   (lambda ()
                     (set-signal! output new-value)))))
  (add-action! input invert-input)
  'OK)

(define (logical-not s)
  (cond ((= s 0) 1)
        ((= s 1) 0)
        (else
          (error "Invalid signal" s))))

;; (A or B) is equivalent to (not ((not A) and (not B)))
(define (or-gate a1 a2 output)
  (let ((i1 (make-wire))
        (i2 (make-wire))
        (i3 (make-wire)))
    (inverter a1 i1)
    (inverter a2 i2)
    (and-gate i1 i2 i3)
    (inverter i3 output)
    'OK))

;;; ----------------------------------

; (define input-1 (make-wire))
; (define input-2 (make-wire))
; (define output (make-wire))
; (probe 'or-gate output)
;
; (or-gate input-1 input-2 output)
; (propagate)
; ; or-gate 2 New-value = 1
; ; or-gate 7 New-value = 0
; ; "propagate done"
; ; 'done
;
; (set-signal! input-1 1)
; (propagate)
; ; or-gate 14 New-value = 1
; ; "propagate done"
