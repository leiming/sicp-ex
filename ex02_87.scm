#lang racket

(require racket/trace)

;;; =zero?
(require "ex03_24.scm")
(require "ex02_75.scm")

;;; make-scheme-number
(require "ex02_78.scm")

(provide
  (all-defined-out))

(define (install-polynomial-package)
  ;;;  polynomial 多项式 (c+1) (x ^ 2).
  (define (make-poly variable term-list)
    (cons variable term-list))
  ;;; 次数 2
  (define (variable p) (car p))
  ;;; 因子系数 (c+1).
  (define (term-list p) (cdr p))

  (define (variable? x ) (symbol? x))
  (define (same-variable? x y)
    (and (variable? x) (variable? y) (eq? x y)))

  (define (tag p) (attach-tag 'polynomial p))
  (put 'make 'polynomial
    (lambda (var terms) (tag (make-poly var terms))))

  (define (empty-termlist? term-list) (null? term-list))
  ;;; 多项式
  (define (make-term order coeff) (list order coeff))
  ;;; 指数
  (define (order term) (car term))
  ;;; 系数 coefficient / coef
  (define (coeff term) (cadr term))

  (define (first-term term-list)
    (car term-list))
  (define (rest-terms term-list)
    (cdr term-list))

  (define (terms-zero? terms)
    terms
    (if (empty-termlist? terms)
        true
        (and (=zero? (coeff (first-term terms)))
             (terms-zero? (rest-terms terms)))))
  (define (poly-zero? p) (terms-zero? (term-list p)))

  (put '=zero?  '(polynomial)
    (lambda (p1) (poly-zero? p1)))

  (define (adjoin-term term term-list)
    (if (=zero? (coeff term))
        term-list
        (cons term term-list)))

  (define (add-terms L1 L2)
      (cond ((empty-termlist? L1) L2)
            ((empty-termlist? L2) L1)
            (else
             (let ((t1 (first-term L1))
                   (t2 (first-term L2)))
                  (cond ((> (order t1) (order t2))
                         (adjoin-term t1
                                      (add-terms (rest-terms L1) L2)))
                        ((< (order t1) (order t2))
                         (adjoin-term t2
                                      (add-terms L1 (rest-terms L2))))
                        (else
                         (adjoin-term
                           (make-term (order t1)
                                      (add (coeff t1) (coeff t2)))
                           (add-terms (rest-terms L1)
                                      (rest-terms L2)))))))))

  (define (add-poly p1 p2)
    (if (same-variable? (variable p1) (variable p2))
        (make-poly (variable p1)
                   (add-terms (term-list p1)
                              (term-list p2)))
        (error "Polys not in same var -- ADD-POLY"
          (list p1 p2))))

  (put 'add '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 p2))))

  (define (nagative-terms term-list)
    (if (not (pair? term-list))
        '()
        (cons (make-term (order (first-term term-list))
                         (- 0 (coeff (first-term term-list))))
              (nagative-terms (rest-terms term-list)))))

  (define (nagative-poly p)
    (make-poly (variable p) (nagative-terms (term-list p))))

  (put 'nagative '(polynomial)
    (lambda (p) (tag (nagative-poly p))))


  ;;; TODO
  ;(define ())

  (put 'sub '(polynomial polynomial)
    (lambda (p1 p2) (tag (add-poly p1 (nagative-poly p2)))))

  'installed-polynomial-package)

(define (make-polynomial var term)
  ((get 'make 'polynomial) var term))

(define (make-term order coef)
  (list order coef))

(install-polynomial-package)

;;; ----------------

;(define zero-terms
;  (list (make-term 4 0)
;        (make-term 2 0)
;        (make-term 0 0)))
;
;(define good-terms
;  (list (make-term 4 1)
;        (make-term 2 0)
;        (make-term 0 3)))
;
;(=zero?  (make-polynomial 'x zero-terms))
;(=zero?  (make-polynomial 'x good-terms))
