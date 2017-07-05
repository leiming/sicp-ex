#lang sicp

(#%provide accumulate)

(define x (list 1 2 3 4 5))
(define y (list 6 7 8))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

;(accumulate cons nil x)
;
;(define (map p sequence)
;  (accumulate (lambda (x y) (cons (p x) y)) nil x))
;
;(map (lambda (x) (* x x)) x)
;
;(define (append seq1 seq2)
;  (accumulate cons seq2 seq1))
;
;(append x y) 
;  
;(define (length sequence)
;  (accumulate (lambda (x y) (+ 1 y)) 0 sequence)) 
;
;(length x)
