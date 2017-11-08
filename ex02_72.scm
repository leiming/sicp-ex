#lang racket

; 如果符号的相对频度跟 练习 2.71 所列举的一样，那么根据 练习 2.71 的结果，
; 对于出现最频繁的字符，每次编码它需要下降 11 层，
; 而对于出现最不频繁的字符，每次编码它需要下降 n−1 层。
; 因此，如果编码字符的次数为 n ，那么对最频繁出现的字符进行编码的复杂度为 Θ(n),
; 而对最不频繁出现的字符进行编码的复杂度为 Θ(n * n) 共 n 个字符，下降 n * (n - 1) 层。
; As for encoding the least frequent symbol, we need to search both left and right branches at every node.
; Since we need to search n-1 nodes, the order of growth is O(n) + O(n-1) + ... + O(1), which is O(n^2).
