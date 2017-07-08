#lang sicp

(#%require "ex02_40.scm") ; flatmap enumerate-interval unique-pairs filter
(#%require racket/trace)

(define empty-board '())

;;; 正序
(define (get-by-index i lst)
  (define (iter k lst)
    (cond
      ((null? lst) -1)  
      ((= k i) (car lst))
      (else
       (iter (+ k 1) (cdr lst)))))
  (iter 1 lst))

(define (safe? k positions)
  (let ((k-value (get-by-index k positions)))
    (define (iter line lst)
      (let ((i (+ 1 (- k line))))
        (cond ((= line 1) #t)
              ((= k-value (car lst)) #f)
              ((= (+ k-value k) (+ (car lst) i)) #f)
              ((= (- k-value k) (- (car lst) i)) #f)
              (else 
               (iter (- line 1) (cdr lst))))))
    (iter k positions)))
    
(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list new-row)))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter 
          (lambda (positions) (safe? k positions))
          (flatmap 
            (lambda (rest-of-queens)
              (map  (lambda (new-row)
                      (adjoin-position new-row k rest-of-queens))
                    (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
  (queen-cols board-size))
  
(display (queens 8))

;;; --------------------------------
