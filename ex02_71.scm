#lang racket

(require "ex02_67.scm")
(require "ex02_69.scm")

(define (generate-huffman-key n)
  (if (= n 0)
      '()
      (cons (list n (expt 2 (- n 1))) (generate-huffman-key (- n 1)))))

(define tree-1 (generate-huffman-tree (generate-huffman-key 5)))
;'(((((leaf 1 1) (leaf 2 2) (1 2) 3) (leaf 3 4) (1 2 3) 7) (leaf 4 8) (1 2 3 4) 15) (leaf 5 16) (1 2 3 4 5) 31)

(decode '(1) tree-1)
; 最频繁的字符需要 1 个二进制位 (leaf 5 16)

(decode '(0 0 0 0) tree-1)
; 最不频繁的字符需要 n - 1 个二进制位 (leaf 1 1)
