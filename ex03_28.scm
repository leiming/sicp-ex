#lang sicp

(#%require "ex03_31.scm")
(#%require "ex03_32.scm")

(#%provide
  or-gate)

(define (logical-or a1 a2)
  (cond ((and (= a1 0) (= a2 0)) 0)
        ((and (= a1 1) (= a2 0)) 1)
        ((and (= a1 0) (= a2 1)) 1)
        ((and (= a1 1) (= a2 1)) 1)
        (else
         (error "Invalid signal" a1 a2))))

(define (or-gate a1 a2 output)
  (define (or-action-procedure)
    (let ((new-value
            (logical-or (get-signal a1) (get-signal a2))))
      (after-delay or-gate-delay
        (lambda ()
          (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  (newline)
  'OK)

;;; -------------------------

; (define input-1 (make-wire))
; (define input-2 (make-wire))
; (define or-line (make-wire))
;
; (probe 'or-line or-line)
; (or-gate  input-1 input-2 or-line)
; (set-signal! input-1 1)
; (propagate)
; (set-signal! input-1 0)
; (propagate)
