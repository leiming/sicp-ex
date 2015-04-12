(define (rec-func n)
  (cond ((< n 3) n)
        ((or (= n 3) (> n 3))
         (+ (rec-func (- n 1)) (* 2 (rec-func (- n 2))) (* 3 (rec-func (- n 3))))
         )))

;(trace rec-func)

(display (rec-func 8))
(newline)

; ----------------------------------------

(define (iter-func n)
  (func-iter 2 1 0 n))

(define (func-iter a b c count)
  (if (= 0 count)
      c
      (func-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))
      ))
(trace func-iter)

(display (iter-func 8))
(newline)
