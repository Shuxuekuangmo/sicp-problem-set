(define a 1)
(define b 2)

(list a b)
(list 'a 'b)

(define (memq item seq)
  (cond ((null? seq) #f)
        ((eq? item (car seq)) seq);如果符号包含在表里，返回符号第一次出现的位置开始的子表。
        (else (memq item (cdr seq)))))

