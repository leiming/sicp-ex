#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (square x) (* x x))

(define (smallest-divisior n)
  (fast-find-divisior n 2))

(define (devides? a b)
  (= (remainder a b) 0))

(define (find-divisior n test-devisior)
  (cond ((> test-devisior n) n)
        ((devides? n test-devisior) test-devisior)
        (else (find-divisior n (+ 1 test-devisior)))))

(define (fast-find-divisior n test-devisior)
  (cond ((> (square test-devisior) n) n)
        ((devides? n test-devisior) test-devisior)
        (else (fast-find-divisior n (+ 1 test-devisior)))))

;;; -----------------------------

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;; ------------------------------

(define (prime? n)
  (= n (smallest-divisior n)))

(define (next-odd n)
  (if (even? n) (+ 1 n)
                (+ 2 n)))

(define (search-for-primes from count)
  (cond ((= count 0)
         (newline))
        ((prime? (next-odd from))
         (timed-prime-test (next-odd from))
         (search-for-primes (next-odd from) (- count 1)))
        (else
           (search-for-primes (next-odd from) count))))

(displayln (search-for-primes 10000000 3))
(displayln (search-for-primes 100000000 3))
(displayln (search-for-primes 1000000000 3))

;;; 10000019 *** 51
;;; 10000079 *** 41
;;; 10000103 *** 162
;;; #<void>
;;;
;;; 100000007 *** 142
;;; 100000037 *** 127
;;; 100000039 *** 127
;;; #<void>
;;;
;;; 1000000007 *** 403
;;; 1000000009 *** 405
;;; 1000000021 *** 403
;;; #<void>
;;; [Finished in 1.281s]
