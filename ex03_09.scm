#lang sicp

;;; REC

;;; http://poet.qiniudn.com/factorial-rec.png

;;; ITER

;;; http://poet.qiniudn.com/factorial-iter.png

(define (a aa bb fff)
  (define (c guess)
    (+ guess 1))
  (define (d dd)
    (* dd 1000 fff))
  (define (iter guess bb)
    (let ((ddd 1) (fff 333))
      (+ (c guess) (d bb))))
  (iter aa (+ 10 bb)))

(a 1 3 999)
