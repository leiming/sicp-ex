(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
            (A x (- y 1))
        ))
    )
)
(display (A 0 11))
(newline)
;;; 2x

(display (A 1 10))
(newline)
;;; 2^x

(display (A 2 1))
(newline)
;;; 2^1 = 2

(display (A 2 2))
(newline)
;;; 2^(2^1) = 2^2 = 4

(display (A 2 3))
(newline)
;;; 2^( 2^(2^1) ) = 2^4 = 16

(display (A 2 4))
(newline)
;;; 2^( 2^(2^(2^1)) ) = 2^16 = 65536