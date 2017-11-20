#lang sicp


(define (mystery x)
    (define (loop x y)
        (if (null? x)
            y
            (let ((temp (cdr x)))
                (set-cdr! x y)
                (loop temp x))))
    (loop x '()))


(define v (list 'a 'b 'c))

(define w (mystery v))

(display v)
;(a)
(newline)
(display w)
;(d c b a)


;v------------------------+
;                         |
;                         v
;w --> [*]----> [*]----> [*]----> '()
;       |        |        |
;       v        v        v
;       'c       'b       'a
