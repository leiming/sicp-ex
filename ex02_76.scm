#lang racket

; As a large system with generic operations evolves,
; new types of data objects or new operations may be needed.
; For each of the three strategies:
; - generic operations with explicit dispatch;
; - data-directed style ;
; - message-passing-style;
; describe the changes that must be made to a system in order to add new types or new operations.
;
; Which organization would be most appropriate for a system in which new types must often be added?
; Which would be most appropriate for a system in which new operations must often be added?

; Answer:
; Add new type : message-passing-style , data-directed style
; Add new op : data-directed style
; http://sicp.readthedocs.io/en/latest/chp2/76.html
