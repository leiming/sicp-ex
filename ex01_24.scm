#lang racket
(require (planet neil/sicp))
(require racket/trace)

(define (square x) (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

;;; a^n 与 a 模n同余 => a^n % n == a % n == a (因为 a < n )
;;; 因此检查 (expmod a n n) 等于 a

(define (fermat-test? n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

; (displayln (fermat-test 16))

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
  (fermat-test? n))

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

(displayln (search-for-primes 10000000 12))
(displayln (search-for-primes 100000000 12))
(displayln (search-for-primes 1000000000 12))

;;; 10000019 *** 4
;;; 10000079 *** 1
;;; 10000103 *** 2
;;; #<void>
;;;
;;; 100000007 *** 1
;;; 100000037 *** 2
;;; 100000039 *** 1
;;; #<void>
;;;
;;; 1000000007 *** 2
;;; 1000000009 *** 1
;;; 1000000021 *** 1
;;; #<void>
;;; [Finished in 1.301s]
