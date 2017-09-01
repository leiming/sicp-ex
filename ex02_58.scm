#lang racket
(require racket/trace)

(define (variable? x) (symbol? x))
(define (same-variable? v1 v2) (and (variable? v1) (variable? v2) (eq? v1 v2)))
(define (=number? exp num) (and (number? exp) (= exp num)))

(define (deriv exp var)
  ;(displayln exp)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        (else
         (error "unknown expression type -- DERIV" exp))))  

(define (sum? x) (and (pair? x) (eq? (cadr x) '+)))  
(define (addend s) (car s))
(define (augend s)
  (let ((r (suffix-sub-exp s '+)))
    (if (< (length r) 2) (car r) r)))

(define (suffix-sub-exp exp sep)
  (cond ((null? exp) '())
        ((eq? (car exp) sep) (cdr exp))
        (else 
         (suffix-sub-exp (cdr exp) sep))))

(define (product? x) (and (pair? x) (eq? (cadr x) '*)))
(define (multiplier p) (car p))
(define (multiplicand p)
  (let ((r (cddr p)))
    (if (< (length r) 2)
        (car r)
        r)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2) (+ a1 a2)))
        (else (let ((s1 (if (or (variable? a1) (number? a1))
                            (list a1 '+)
                            (append a1 '(+))))
                    (s2 (if (or (variable? a2) (number? a2))
                            (list a2)
                            a2)))
                (append s1 s2)))))

;; TODO 去括号
;; http://kelvinh.github.io/wiki/sicp/
(define (make-product a1 a2)
  (cond ((or (=number? a1 0) (=number? a2 0)) 0)
        ((=number? a1 1) a2)
        ((=number? a2 1) a1)
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else 
         (list a1 '* a2))))


(deriv '(x + ( 3 * (x + (y + 2 )))) 'x)
(deriv '(x * y * (x + 3)) 'x)
(deriv '((x * y) * (x + 3)) 'x)
(deriv '(x * (y * (x + 3))) 'x)
