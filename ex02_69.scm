#lang racket

(require "ex02_67.scm")

(provide
  generate-huffman-tree)

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (successive-merge set)
  (let ((first (car set))
        (second (cadr set))
        (last (cddr set)))
    (if (null? last)
        (make-code-tree first second)
        (successive-merge (adjoin-set (make-code-tree first second)
                                      last)))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

;(generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))
