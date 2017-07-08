#lang sicp

(#%require "ex02_40.scm") ;;; flatmap enumerate-interval unique-pairs
(#%require "ex02_33.scm") ;;; accumulate  
  
(define (unique-triples-one n)
    (flatmap (lambda (i)
                 (map (lambda (j) 
                        (cons i j))
                      (unique-pairs (- i 1))))
             (enumerate-interval 1 n)))

(define (unique-triples-two n)
    (flatmap (lambda (i)
                 (flatmap (lambda (j) 
                            (map (lambda (k)
                                    (list i j k))
                                 (enumerate-interval 1 (- j 1))))
                          (enumerate-interval 1 (- i 1))))
             (enumerate-interval 1 n)))

(define (filter-ternary-one l sum)
  (filter (lambda (item) 
            (let ((i (car item))
                  (j (cadr item))
                  (k (caddr item)))
              (= sum (+ i j k))))
          l))
          
(define (filter-ternary-two l sum)
  (filter (lambda (i) (= sum (accumulate + 0 i))) l))

(unique-triples-one 5)
(unique-triples-two 5)
(filter-ternary-one (unique-triples-one 5) 6)
(filter-ternary-two (unique-triples-two 5) 6)

;; http://community.schemewiki.org/?sicp-ex-2.41
