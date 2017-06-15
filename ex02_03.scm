#lang sicp

(#%require "ex02_02.scm")
; rectangle 矩形
; high 高
;round 宽
; girth 周长
; area 面积
; vertex 顶点

(define (ginth high round)
  (* 2 (+ high round)))

(define (area high round)
  (* high round))

(define (make-rectangle-by-point first-point last-point)
  (cons first-point last-point))

(define (first-point r-p)
  (car r-p))

(define (last-point r-p)
  (cdr r-p))

(define (high-by-point r)
  (abs (- (x-point (first-point r)) (y-point (last-point r)))))

(define (round-by-point r)
  (abs (- (y-point (first-point r)) (x-point (last-point r)))))

(define (ginth-rectangle-by-point r)
  (ginth (high-by-point r) (high-by-point r)))

(define (area-rectangle-by-point r)
  (area (high-by-point r) (high-by-point r)))

(define r-one (make-rectangle-by-point (make-point 1 2) (make-point 3 4)))
(ginth-rectangle-by-point r-one)
(area-rectangle-by-point r-one)

(define (make-rectangle-by-line first-point width height)
  (cons first-point (cons width height)))

(define (high-by-line r-l)
  (cdr (cdr r-l)))

(define (round-by-line r-l)
  (car (cdr r-l)))

(define (ginth-rectangle-by-line r)
  (ginth (high-by-line r) (round-by-line r)))

(define (area-rectangle-by-line r)
  (area (high-by-line r) (round-by-line r)))

(define r-two (make-rectangle-by-line (make-point 1 2) 3 5))
(ginth-rectangle-by-line r-two)
(area-rectangle-by-line r-two)
