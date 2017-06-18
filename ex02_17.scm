#lang sicp

(define list-one (list 214 234 2343 23 423 4234 234))

(define (last-pair-one l)
  (list-ref l (- (length l) 1)))

(last-pair-one list-one)

(define (last-pair-two l)
  (if (= 1 (length l))
      (car l)
      (last-pair-two (cdr l))))

(last-pair-two list-one)

(define (last-pair-three l)
  (let ((rest (cdr l)))
    (if (null? rest)
        (car l)
        (last-pair-three rest))))

(last-pair-three list-one)
