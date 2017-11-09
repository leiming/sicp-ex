#lang racket

(require "ex03_24.scm")
(require "ex02_75.scm")
(require "ex02_77.scm")

(provide
  make-scheme-number)

(define (attach-tag type-tag contents)
    (if (number? contents)
        contents
        (cons type-tag contents)))

(define (type-tag datum)
    (cond ((number? datum
            'scheme-number))
          ((pair? datum
            (car datum)))
          (else
            (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
    (cond ((number? datum
            datum))
          ((pair? datum
            (cdr datum)))
          (else
            (error "Bad tagged datum -- CONTENT" datum))))

(define (install-scheme-number-package)

  (define (tag x)
    (attach-tag 'scheme-number x))
  (put 'add '(scheme-number scheme-number)
       (lambda (x y) (tag (+ x y))))
  (put 'sub '(scheme-number scheme-number)
       (lambda (x y) (tag (- x y))))
  (put 'mul '(scheme-number scheme-number)
       (lambda (x y) (tag (* x y))))
  (put 'div '(scheme-number scheme-number)
       (lambda (x y) (tag (/ x y))))

  (put 'make 'scheme-number
       (lambda (x) (tag x)))

  (put 'equ? '(scheme-number scheme-number)
       (lambda (x y) (= x y)))

  (put '=zero? '(scheme-number)
       (lambda (x) (= x 0)))

  'installed-scheme-number-package)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(install-scheme-number-package)

;(equ? (make-scheme-number 1)
;      (make-scheme-number 1))
;(make-rational 1 3)
;(make-scheme-number 3)
