                                        ;第一次写的

(define (union-set set1 set2)
  (define (not-in-elements s1 s2)   ;余集
    (cond ((null? s1) '())
          ((not (element-of-set? (car s1) s2)) (cons (car s1)
                                                     (not-in-elements (cdr s1) s2)))
          (else (not-in-elements (cdr s1) s2))))
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (append set1 (not-in-elements set2 set1)))))

                                        ;filter简化
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (append set1 (filter (lambda (x) (not (element-of-set? x set1))) set2)))))

                                        ;其他版本
                                        ;尾递归


(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1) ;省略会造成浪费计算
        ((element-of-set? (car set1) set2) (union-set (cdr set1) (cons (car set1) set2)))
        (else (union-set (cdr set1) set2))))
                                        ;用adjoin化简
(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (cdr set1) (adjoin-set (car set1) set2)))))

                                        ;最短的写法
(define (union-set set1 set2)
  (accumulate adjoin-set set1 set2))
