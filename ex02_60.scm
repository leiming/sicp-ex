#lang sicp

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? (car set) x) #t)
        (else 
         (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (union-set set1 set2) 
 (append set1 set2))

(define (intersection-set set1 set2)
  (define (iter set result)
    (if (or (null? set) (null? set2))
        (reverse result)
        (let ((current-element (car set))
              (remain-element (cdr set)))
          (if (and (element-of-set? current-element set2)
                   (not (element-of-set? current-element result)))
              (iter remain-element (cons current-element result))
              (iter remain-element result)))))    
  (iter set1 '()))

(intersection-set (list 1 2 3 2 1) (list 4 5 2 1))
