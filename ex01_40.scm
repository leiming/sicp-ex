#lang sicp

(#%provide fixed-point)

(define tolernace 0.00001)
(define dx 0.00001)

(define (square x) (* x x))

(define (fixed-point f first-guess)
  (define (close-enough? a b)
    (< (abs (- a b)) tolernace))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? next guess)
        next
        (try next))))
  (try first-guess))

;(fixed-point cos 1)

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x)) dx)))

(define (newtons-transform g)
  (lambda (x)
    (- x (/ (g x) ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newtons-transform g) guess))

(define (sqrt x)
  (newtons-method (lambda (y) (- (square y) x))
                  1.0))

;(sqrt 2)

(define (cubic a b c)
  (lambda (x)
    (+ (* x x x))  (* a (square x) (* b x) c)))

; (newtons-method (cubic 3 2 1) 1)
