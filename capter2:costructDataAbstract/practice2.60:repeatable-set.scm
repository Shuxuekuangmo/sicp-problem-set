                                        ;集合可重复后，谓词函数不变
(define (element-of-set? elem set)
  (cond ((null? set) #f)
        ((equal? elem (car set)) #t)
        (else (element-of-set? elem (cdr set)))))

                                        ;简化：
(define (adjoin elem set) (cons elem set));效率增加

                                        ;并集操作可以简化，效率增加
(define (union-set set1 set2)
  (append set1 set2))
                                        ;交集


                                        ;重复的交集元素也会出现集合中
                                        ;效率降低
(define (intersection-set s1 s2)
  (define (intersection-set-strict set1 set2)
    (filter (lambda (x) (element-of-set? x set1)) set2)) ;原有的intersection-set1
  (let ((inter (intersection-set-strict s1 s2))
        (union (union-set s1 s2)))
    (filter (lambda (x) (element-of-set? x inter)) union)))


                                        ;在更多地使用adjoin和union-set的程序中倾向于使用这种表示
