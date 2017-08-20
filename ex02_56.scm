#lang sicp

(define (=number? exp num)
  (and (number? exp)
       (= exp num)))
        
(define (make-product m1 m2) 
  (cond ((or (=number? m1 0) (=number? m2 0)) 0) 
        ((=number? m1 1) m2) 
        ((=number? m2 1) m1) 
        ((and (number? m1) (number? m2)) (* m1 m2)) 
        (else (list '* m1 m2)))) 

(define (product? x)
  (and (pair? x)
       (eq? (car x) '*)))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else
         (list '** base exponent))))

(define (base x)
  (cadr x))
  
(define (exponent x)
  (caddr x))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**))) 

(define (variable? x)
  (symbol? x))

(define (deriv exp var)
  (cond ((exponentiation? exp)
         (make-product
          (make-product
           (exponent exp) 
           (make-exponentiation 
            (base exp) 
            (if (number? (exponent exp)) 
                (- (exponent exp) 1)
                (list '- (exponent exp) 1))))
          (deriv (base exp) var)))
        ((variable? exp)
         (if (eq? exp var) 1 0))
        (else 
         (error "unknown exp -- " exp))))

(deriv '(** x 0) 'x)
(deriv '(** x 1) 'x)
(deriv '(** x 2) 'x)
(deriv '(** x 3) 'x)
(deriv '(** x n) 'x)
