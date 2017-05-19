#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (cube x)
  (* x x x))

(trace-define (p x)
  (-
    (* 3 x)
    (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (p (sine (/ angle 3.0)))))

;(trace p)
(display (sine 12.15))

; http://kelvinh.github.io/wiki/sicp/

; b) 对 (sine a) 进行展开，第一次后a变成a/3，第二次变成a/9，
; 所以，在n次之后，a变成了a除以3的n次方。
; 空间和步数是正比于展开次数n的，所以，n关于a的阶就是空间和步数关于a的阶。
; 展开的终止条件是 a / 3^n ≤ 0.1 ，可以求出 n ≥ log3(10a) ，
; 即n会大于等于以3为底10a的对数。所以空间和步数关于a的增长阶是对数的。
