#lang racket

(require "ex03_24.scm")
(require "ex02_77.scm")

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
  (put 'make '(scheme-number scheme-number)
       (lambda (x) (tag x)))

  (put 'make 'scheme-number
       (lambda (x) (tag x)))
  (put 'make 'b
       (lambda (x) (tag x)))
  (put 'a 'b
       (lambda (x) (tag x)))
  'installed-scheme-number-package)

(define (make-scheme-number n)
  ((get 'make 'scheme-number) n))

(install-scheme-number-package)

(make-rational 1 3)
(make-scheme-number 3)
