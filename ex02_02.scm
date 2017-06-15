#lang sicp

(#%provide
  make-segment
  start-segment
  end-segment
  make-point
  x-point
  y-point
  midpoint-segment)

(define (make-segment start-segment end-segment)
  (cons start-segment end-segment))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average x y)
  (/ (+ x y) 2.0))

(define (midpoint-segment s)
  (let ((x (average (x-point (start-segment s)) (x-point (end-segment s))))
        (y (average (y-point (start-segment s)) (y-point (end-segment s)))))
    (make-point x y)))

; (define seg-one (make-segment (make-point 2 3) (make-point 2 3)))
; (print-point (midpoint-segment seg-one))
