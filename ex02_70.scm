#lang racket

(require "ex02_68.scm")
(require "ex02_69.scm")

(define rock-key '((a 2) (na 16) (boom 1) (Sha 3) (Get 2) (yip 9) (job 2) (Wah 1)))

(define rock-tree (generate-huffman-tree rock-key))

(define rock-song '(Get a job Sha na na na na na na na na Get a job Sha na na na na na na na na Wah yip yip yip yip yip yip yip yip yip Sha boom))

(encode rock-song rock-tree)
;;; '(1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

(length (encode rock-song rock-tree))
;;; 84

 ; If we were to use a fixed-length encoding on that rock song, we would need 3 bits (8 = 2^3) per symbol, i.e.:
(* 3 (length rock-song))
;;; 108
