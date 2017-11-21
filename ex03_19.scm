#lang sicp
(#%require "ex03_13.scm")

(define (has-cycle? x)
  (define (iter s1 s2)
    (cond ((or (null? s1) (null? s2))
           #f)
          ((equal? s1 s2) #t)
          (else
           (iter (next s1 1) (next s2 2)))))
  (iter (next x 1) (next x 2)))

(define (next set step)
  (if (not (pair? set))
      nil
      (cond ((= step 1) (cdr set))
            ((= step 2)
             (if (pair? (cdr set))
                 (cddr set)
                 nil))
            (else
             (error "step error--" step)))))

(has-cycle? (list 1 3 4 5))
(define loop (list 1 2 3))
(set-cdr! (last-pair loop) loop)
(has-cycle? loop)
(define loop-list (list 1 2 3))
(set-cdr! (last-pair loop-list) loop-list)
(has-cycle? loop-list)
