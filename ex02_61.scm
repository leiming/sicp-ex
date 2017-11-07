#lang racket
;(#%require racket/trace)

(provide
  intersection-set)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (car set)) #t)
        ((< x (car set)) #f)
        (else 
         (element-of-set? x (cdr set)))))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-set (cdr set1) set2))
              ((> x1 x2)
               (intersection-set set1 (cdr set2)))))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((= (car set) x) set)
        ((> (car set) x) (cons x set))
        (else
         (cons (car set) (adjoin-set x (cdr set))))))
  
;(element-of-set? 8 '(1 2 4 5 6))
;(intersection-set '(1 2 5) '(2 3 4 5 6))
;(adjoin-set 1 '(2 3 4 5 7))
