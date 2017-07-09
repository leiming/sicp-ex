#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edg1-frame frame)
  (cadr frame))
    
(define (edg2-frame frame)
  (caddr frame))

(define (make-frame-another origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-another frame)
  (car frame))
    
(define (edge1-frame-another frame)
  (cadr frame))

(define (edge2-frame-another frame)
  (cddr frame))

(define a-frame (make-frame 1 2 3))
  
(origin-frame a-frame)
(edg1-frame a-frame)
(edg2-frame a-frame)

(define another-frame (make-frame-another 1 2 3))
  
(origin-frame-another another-frame)
(edge1-frame-another another-frame)
(edge2-frame-another another-frame)
