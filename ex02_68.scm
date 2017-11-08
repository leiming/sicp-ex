#lang racket

(require racket/trace)
(require "ex02_67.scm")

(provide
  encode)

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (encode-symbol smb tree)
  (define (branch-correct? branch)
     (if (leaf? branch)
         (equal? smb (symbol-leaf branch))
         (element-of-set? smb (symbols branch))))

  (let ((lb (left-branch tree))
        (rb (right-branch tree)))
   (cond ((branch-correct? lb)
          (if (leaf? lb) '(0) (cons 0 (encode-symbol smb lb))))
         ((branch-correct? rb)
          (if (leaf? rb) '(1) (cons 1 (encode-symbol smb rb))))
         (else (error "bad symbol -- ENCODE-SYMBOL" smb)))))


(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define sample-key '(A D A B B C A))
; (encode sample-key sample-tree)
; '(0 1 1 0 0 1 0 1 0 1 1 1 0)
