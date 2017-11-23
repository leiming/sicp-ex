#lang sicp

(define (make-deque)
  (cons '() '()))

(define (front-ptr deque)
  (car deque))

(define (rear-ptr deque)
  (cdr deque))

(define (set-front-ptr! deque item)
  (set-car! deque item))

(define (set-rear-ptr! deque item)
  (set-cdr! deque item))

(define (empty-deque? deque)
  (or (null? (front-ptr deque)) (null? (rear-ptr deque))))

(define (front-deque deque)
  (if (empty-deque? deque)
      (error "deque empty")
      (car (front-ptr deque))))

(define (rear-deque deque)
  (if (empty-deque? deque)
      (error "deque empty")
      (car (rear-ptr deque))))

(define (prev-ptr item)
  (cdar item))

(define (next-ptr item)
  (cdr item))

(define (set-prev-ptr! node ptr)
  (set-cdr! (car node) ptr))

(define (set-next-ptr! node ptr)
  (set-cdr! node ptr))

(define (front-insert-deque! deque item)
  (let ((new-pair (cons (cons item nil) nil)))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)
           deque)
          (else
           (set-prev-ptr! (front-ptr deque) new-pair)
           (set-next-ptr! new-pair (front-ptr deque))
           (set-front-ptr! deque new-pair)
           deque))))

(define (rear-insert-deque! deque item)
  (let ((new-pair (cons (cons item nil) nil)))
    (cond ((empty-deque? deque)
           (set-front-ptr! deque new-pair)
           (set-rear-ptr! deque new-pair)
           deque)
          (else
           (set-prev-ptr! new-pair (rear-ptr deque))
           (set-next-ptr! (rear-ptr deque) new-pair)
           (set-rear-ptr! deque new-pair)
           deque))))


(define (front-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "empty deque " deque))
        ((has-only-item deque)
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '())
         deque)
        (else
         (set-front-ptr! deque (next-ptr (front-ptr deque)))
         (set-prev-ptr! (front-ptr deque) nil)
         deque)))

(define (has-only-item deque)
  (eq? (front-ptr deque) (rear-ptr deque)))

(define (rear-delete-deque! deque)
  (cond ((empty-deque? deque)
         (error "empty deque " deque))
        ((has-only-item deque)
         (set-front-ptr! deque '())
         (set-rear-ptr! deque '())
         deque)
        (else
         (set-rear-ptr! deque (prev-ptr (rear-ptr deque)))
         (set-next-ptr! (rear-ptr deque) nil)
         deque)))

(define (print-deque deque)
  (define (rec item)
    (if (null? item)
        (begin
          (newline))
        (begin
          (display (caar item))
          (display " ")
          (rec (cdr item)))))
  (rec (front-ptr deque)))

(define a (make-deque))
(print-deque (front-insert-deque! a 'a))
(print-deque (front-insert-deque! a 'c))
(print-deque (rear-insert-deque! a 'x))
(print-deque (rear-insert-deque! a 'y))
(print-deque (rear-insert-deque! a 'z))
(print-deque (front-delete-deque! a))
(print-deque (front-delete-deque! a))
(print-deque (front-insert-deque! a 't))
(print-deque (front-delete-deque! a))
(print-deque (rear-delete-deque! a))
(print-deque (rear-delete-deque! a))
(print-deque (rear-insert-deque! a 'h))
(print-deque (rear-delete-deque! a))
(print-deque (rear-delete-deque! a))
;(print-deque (rear-delete-deque! a))
(print-deque (front-insert-deque! a 'a))
