#lang sicp

(car ''ab)
; 'quote

''ab
; (mcons 'quote (mcons 'ab '()))

'''ab
; (mcons 'quote (mcons (mcons 'quote (mcons 'ab '())) '()))

' ''ab
; (mcons 'quote (mcons (mcons 'quote (mcons 'ab '())) '()))
