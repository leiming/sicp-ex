#lang sicp

(define (for-each proc items)
  (cond ((null? items) #t)
        ((proc (car items))
         (for-each proc (cdr items)))))

(for-each (lambda (x) (newline) (display x))
          (list 2345 56 43 234))
