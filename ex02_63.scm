 #lang racket

(provide
  tree->list-2)

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))
  
(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set)) 
         (element-of-set? x (left-branch set)))
        ((> x (entry set))
         (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) 
         (make-tree (entry set)
                    (adjoin-set x (left-branch set))
                    (right-branch set)))
        ((> x (entry set))
         (make-tree (entry set)
                    (left-branch set)
                    (adjoin-set x (right-branch set))))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))


;(define a-tree (make-tree 3 '() '()))
;(element-of-set? 5 a-tree)
;(adjoin-set 6 (adjoin-set 7 (adjoin-set 1 a-tree)))

(define tree-1 (make-tree 7 (make-tree 3 (make-tree 1 '() '())
                                         (make-tree 5 '() '()))
                            (make-tree 9 '() (make-tree 11 '() '()))))

(define tree-2 (make-tree 3 (make-tree 1 '() '())
                            (make-tree 7 (make-tree 5 '() '())
                                         (make-tree 9 '() (make-tree 11 '() '())))))
                                                   
                            
;(tree->list-1 tree-1)
;(tree->list-2 tree-1)
;(tree->list-1 tree-2)
;(tree->list-2 tree-2)

; 试答
; a) 结果相同，都是「链接」左子树与右子树，不同的是，tree->list-1 用 append， tree->list-2 用迭代展开
; b) 步数增长，tree->list-1 快，因为使用 append 【p68】,每次都需遍历一次左表

; 标准答案
;For tree->list-1:
;T(n) = 2*T(n/2) + O(n/2) (as the procedure append takes linear time)
;Solving above equation, we get T(n) = O(n * log n)
;For tree->list-2:
;T(n) = 2*T(n/2) + O(1)
;Solving the above equation, we get T(n) = O(n)
