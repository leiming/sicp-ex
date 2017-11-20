#lang sicp

(#%require "ex03_13.scm")
(#%require racket/trace)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))


(define (has-cycle? x)
  (define (has-cycle-iter x memo-list)
    (cond ((null? x) #f)
          ((not (pair? x)) #f)
          ((element-of-set? x memo-list) #t)
          (else
           (has-cycle-iter (cdr x) (cons x memo-list)))))
  ;(trace has-cycle-iter)
  (has-cycle-iter x '()))


;http://sicp.readthedocs.io/en/latest/chp3/18.html
(define (loop? lst)
    (let ((identity (cons '() '())))
        (define (iter remain-list)
            (cond ((null? remain-list
                    #f))
                  ((eq? identity (car remain-list)
                    #t))
                  (else
                    (set-car! remain-list identity)
                    (iter (cdr remain-list)))))
        (iter lst)))

(define x (list 'a 'b 'c))
(define y (make-cycle x))
(has-cycle? y)
(define loop (list 1 2 3))
(set-cdr! (last-pair loop) loop)
(has-cycle? loop)
(define loop-list (list 1 2 3))
(set-cdr! (last-pair loop-list) loop-list)
(has-cycle? loop-list)
