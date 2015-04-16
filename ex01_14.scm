;;; page 26
;;; Example: Counting change

(define (charge-coin amount coin-type)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= coin-type 0)) 0)
        (else (+ (charge-coin amount
                              (- coin-type 1))
                 (charge-coin (- amount
                                 (coin-type-conf coin-type))
                              coin-type)))))

(trace charge-coin)

(define (coin-type-conf coin-type)
  (cond ((= coin-type 1) 1)
        ((= coin-type 2) 5)
        ((= coin-type 3) 10)
        ((= coin-type 4) 25)
        ((= coin-type 5) 50)))

(define (count-change amount)
  (charge-coin amount 5))


(display (count-change 11))
;;; 292

;;; http://sicp.readthedocs.org/en/latest/_images/14.pngz

;| > (charge-coin 11 5)
;| | > (charge-coin 11 4)
;| | | > (charge-coin 11 3)
;| | | | > (charge-coin 11 2)
;| | | | | > (charge-coin 11 1)
;| | | | | | > (charge-coin 11 0)
;| | | | | | 0
;| | | | | | > (charge-coin 10 1)
;| | | | | | | > (charge-coin 10 0)
;| | | | | | | 0
;| | | | | | | > (charge-coin 9 1)
;| | | | | | | | > (charge-coin 9 0)
;| | | | | | | | 0
;| | | | | | | | > (charge-coin 8 1)
;| | | | | | | | | > (charge-coin 8 0)
;| | | | | | | | | 0
;| | | | | | | | | > (charge-coin 7 1)
;| | | | | | | | | | > (charge-coin 7 0)
;| | | | | | | | | | 0
;| | | | | | | | | | > (charge-coin 6 1)
;| | | | | | | |[11] > (charge-coin 6 0)
;| | | | | | | |[11] 0
;| | | | | | | |[11] > (charge-coin 5 1)
;| | | | | | | |[12] > (charge-coin 5 0)
;| | | | | | | |[12] 0
;| | | | | | | |[12] > (charge-coin 4 1)
;| | | | | | | |[13] > (charge-coin 4 0)
;| | | | | | | |[13] 0
;| | | | | | | |[13] > (charge-coin 3 1)
;| | | | | | | |[14] > (charge-coin 3 0)
;| | | | | | | |[14] 0
;| | | | | | | |[14] > (charge-coin 2 1)
;| | | | | | | |[15] > (charge-coin 2 0)
;| | | | | | | |[15] 0
;| | | | | | | |[15] > (charge-coin 1 1)
;| | | | | | | |[16] > (charge-coin 1 0)
;| | | | | | | |[16] 0
;| | | | | | | |[16] > (charge-coin 0 1)
;| | | | | | | |[16] 1
;| | | | | | | |[15] 1
;| | | | | | | |[14] 1
;| | | | | | | |[13] 1
;| | | | | | | |[12] 1
;| | | | | | | |[11] 1
;| | | | | | | | | | 1
;| | | | | | | | | 1
;| | | | | | | | 1
;| | | | | | | 1
;| | | | | | 1
;| | | | | 1
;| | | | | > (charge-coin 6 2)
;| | | | | | > (charge-coin 6 1)
;| | | | | | | > (charge-coin 6 0)
;| | | | | | | 0
;| | | | | | | > (charge-coin 5 1)
;| | | | | | | | > (charge-coin 5 0)
;| | | | | | | | 0
;| | | | | | | | > (charge-coin 4 1)
;| | | | | | | | | > (charge-coin 4 0)
;| | | | | | | | | 0
;| | | | | | | | | > (charge-coin 3 1)
;| | | | | | | | | | > (charge-coin 3 0)
;| | | | | | | | | | 0
;| | | | | | | | | | > (charge-coin 2 1)
;| | | | | | | |[11] > (charge-coin 2 0)
;| | | | | | | |[11] 0
;| | | | | | | |[11] > (charge-coin 1 1)
;| | | | | | | |[12] > (charge-coin 1 0)
;| | | | | | | |[12] 0
;| | | | | | | |[12] > (charge-coin 0 1)
;| | | | | | | |[12] 1
;| | | | | | | |[11] 1
;| | | | | | | | | | 1
;| | | | | | | | | 1
;| | | | | | | | 1
;| | | | | | | 1
;| | | | | | 1
;| | | | | | > (charge-coin 1 2)
;| | | | | | | > (charge-coin 1 1)
;| | | | | | | | > (charge-coin 1 0)
;| | | | | | | | 0
;| | | | | | | | > (charge-coin 0 1)
;| | | | | | | | 1
;| | | | | | | 1
;| | | | | | | > (charge-coin -4 2)
;| | | | | | | 0
;| | | | | | 1
;| | | | | 2
;| | | | 3
;| | | | > (charge-coin 1 3)
;| | | | | > (charge-coin 1 2)
;| | | | | | > (charge-coin 1 1)
;| | | | | | | > (charge-coin 1 0)
;| | | | | | | 0
;| | | | | | | > (charge-coin 0 1)
;| | | | | | | 1
;| | | | | | 1
;| | | | | | > (charge-coin -4 2)
;| | | | | | 0
;| | | | | 1
;| | | | | > (charge-coin -9 3)
;| | | | | 0
;| | | | 1
;| | | 4
;| | | > (charge-coin -14 4)
;| | | 0
;| | 4
;| | > (charge-coin -39 5)
;| | 0
;| 4
;4