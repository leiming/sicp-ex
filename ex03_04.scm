#lang sicp

(define (make-account balance initPassword)
  (let ((maxTestCount 6))
    (define (withdraw amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (call-the-cops amount)
      "Call the cops!")
    (define  (dispatch password message)
      (if (not (eq? password initPassword))
          (lambda (amount)
            (if (= maxTestCount 0)
                (call-the-cops amount)
                (begin (set! maxTestCount (- maxTestCount 1))
                       "Incorrect password")))
          (begin
            (set! maxTestCount 6)
            (cond ((eq? 'withdraw message) withdraw)
                  ((eq? 'deposit message) deposit)
                  (else
                   (error "Unknown request -- MAKE-ACCOUNT" message))))))
    dispatch))

(define acc (make-account 100 'hello))

((acc 'hellod 'withdraw) 20)
((acc 'hellod 'withdraw) 13)
((acc 'hello 'withdraw) 13)
((acc 'hellod 'deposit) 12)
((acc 'hellod 'deposit) 12)
((acc 'hellod 'withdraw) 13)
((acc 'hellod 'withdraw) 13)
((acc 'hellod 'withdraw) 13)
((acc 'hellod 'withdraw) 13)
((acc 'hellod 'withdraw) 13)
((acc 'hellod 'withdraw) 13)
((acc 'hello 'withdraw) 13)