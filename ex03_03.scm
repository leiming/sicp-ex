#lang sicp

(define (make-account balance initPassword)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)))
  (define (deposit amount)
          (set! balance (+ balance amount))
          balance)
  (define (dispatch password message)
    (if (not (eq? password initPassword))
        (lambda (amount) "Incorrect password")
        (cond ((eq? 'withdraw message) withdraw)
              ((eq? 'deposit message) deposit)
              (else
               (error "Unknown request -- MAKE-ACCOUNT" message)))))
  dispatch)

;(define acc (make-account 100 'hello))
;
;((acc 'hello 'withdraw) 20)
;((acc 'hello 'withdraw) 13)
;((acc 'hellod 'withdraw) 13)
;((acc 'hello 'deposit) 12)
