#lang racket
(require "ex03_24.scm")

(provide
  (all-defined-out))

(define (make-from-mag-ang r a)
  (define (dispatch op)
    (cond ((eq? op 'real-part)
           (* r (cos a)))
          ((eq? op 'imag-part)
           (* r (sin a)))
          ((eq? op 'magnitude)
           r)
          ((eq? op 'angle)
           a)
          (else "Unknown op -- MAKE-FROM-MAG-ANG" op)))
  dispatch)

(define (attach-tag type-tag contents)
    (if (number? contents)
        contents
        (cons type-tag contents)))

(define (type-tag datum)
    (cond ((number? datum)
           'scheme-number)
          ((pair? datum)
           (car datum))
          (else
           (error "Bad tagged datum -- TYPE-TAG" datum))))

(define (contents datum)
    (cond ((number? datum)
           datum)
          ((pair? datum)
           (cdr datum))
          (else
           (error "Bad tagged datum -- CONTENT" datum))))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map contents args))
          (error "No method for the given types -- APPLY-GENERIC"
                 (list op type-tags))))))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (add x y) (apply-generic 'add x y))
(define (sub x y) (apply-generic 'sub x y))
(define (mul x y) (apply-generic 'mul x y))
(define (div x y) (apply-generic 'div x y))
(define (equ? x y) (apply-generic 'equ? x y))
(define (=zero? x) (apply-generic '=zero? x))
(define (nagative x) (apply-generic 'nagative x))

(define (square x) (* x x))
