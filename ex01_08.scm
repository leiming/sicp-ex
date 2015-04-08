(define (cube-iter guess x)
    (if (improve-good-enough? guess (improve-cube guess x))
        (improve-cube guess x)
        (cube-iter (improve-cube guess x) x)
    )
)

(define (improve-cube guess x)
    (/
        (+ (/ x (* guess guess)) (* 2 guess))
    3)
)

(define (improve-good-enough? guess new-guess)
    (< (abs (- 1 (/ guess new-guess))) 0.001)
)

(define (cute x)
    (cube-iter 1.0 x)
)

(display (cute 27))
