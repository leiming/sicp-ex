#lang sicp

(define l (list 1 2 3 4 5))

(define (reverse l)
  (define (reverse-iter l n)
    (if (null? l)
        n
        (reverse-iter (cdr l) (cons (car l) n))))
  (reverse-iter l nil))

(define (reverse-rec l)
  (if (null? (cdr l))
      l
      (append (reverse-rec (cdr l)) (cons (car l) nil))))

l
(reverse l)
(reverse-rec l)
