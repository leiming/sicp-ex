#lang sicp

(define (make-queue)
  (cons '() '()))

(define (front-ptr queue)
  (car queue))

(define (rear-ptr queue)
  (cdr queue))

(define (set-front-ptr! queue item)
  (set-car! queue item))

(define (set-rear-ptr! queue item)
  (set-cdr! queue item))

(define (empty-queue? queue)
  (null? (front-ptr queue)))

(define (front-queue queue)
  (if (empty-queue? queue)
      (error "queue empty")
      (car (front-ptr queue))))

(define (insert-queue! queue item)
  (let ((new-pair (cons item '())))
    (cond ((empty-queue? queue)
           (set-front-ptr! queue new-pair)
           (set-rear-ptr! queue new-pair)
           queue)
          (else
           (set-cdr! (rear-ptr queue) new-pair)
           (set-rear-ptr! queue new-pair)
           queue))))

(define (delete-queue! queue)
  (cond ((empty-queue? queue)
         (error "queue empty" queue))
        (else
         (set-front-ptr! queue (cdr (front-ptr queue)))
         queue)))

(define (print-queue queue)
  (define (print queue)
    (cond ((null? queue)
           (newline))
          (else
           (display (car queue))
           (display " ")
           (print (cdr queue)))))
  (print (front-ptr queue)))

(define q1 (make-queue))
(print-queue (insert-queue! q1 'a))
(print-queue (insert-queue! q1 'b))
(print-queue (insert-queue! q1 'c))
(print-queue (insert-queue! q1 'd))
(print-queue (delete-queue! q1))
