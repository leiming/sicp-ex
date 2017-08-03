#lang sicp

(#%require sicp-pict)

;; https://docs.racket-lang.org/sicp-manual/

(define (flip-horiz painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)) painter))
                      
(define (180-rotate painter)
  ((transform-painter (make-vect 1.0 1.0)
                      (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0)) painter))
                      

(define (270-rotate painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0)) painter))

(paint einstein)
(paint (flip-horiz einstein))
(paint (180-rotate einstein))
(paint (270-rotate einstein))