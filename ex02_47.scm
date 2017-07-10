#lang sicp

(#%provide make-frame origin-frame edge1-frame edge2-frame)

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))
    
(define (edge2-frame frame)
  (caddr frame))

(define (make-frame-another origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-another frame)
  (car frame))
    
(define (edge1-frame-another frame)
  (cadr frame))

(define (edge2-frame-another frame)
  (cddr frame))

;(define a-frame (make-frame 1 2 3))
;  
;(origin-frame a-frame)
;(edge1-frame a-frame)
;(edge2-frame a-frame)
;
;(define another-frame (make-frame-another 1 2 3))
;  
;(origin-frame-another another-frame)
;(edge1-frame-another another-frame)
;(edge2-frame-another another-frame)
