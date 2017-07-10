#lang sicp

(#%provide make-vect xcor-vect ycor-vect add-vect sub-vect scale-vect)

(define (make-vect x y)
  (cons x y))
    
(define (xcor-vect v)
  (car v))
    
(define (ycor-vect v)
  (cdr v))
    
(define (add-vect v1 v2)
  (cons (+ (xcor-vect v1) (xcor-vect v2))
        (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (cons (- (xcor-vect v1) (xcor-vect v2))
        (- (ycor-vect v1) (ycor-vect v2))))
        
(define (scale-vect v scale)
  (cons (* scale (xcor-vect v))
        (* scale (ycor-vect v))))

;(add-vect (make-vect 1 2) (make-vect 3 4))
;(scale-vect (make-vect 1 3) 5)