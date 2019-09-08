                                        ;如果set中的元素是已经排好序的，如;升序排列,有些集合操作就可以大大简化。
(define (element-of-set? x s)
  (cond ((null? s) #f)
        ((= x (car s)) #t)
        ((< x (car s)) #f)
        (else (element-of-set? x (cdr s)))))
                                        ;查找不存在于集合中的元素时，新的版本可能在查找到表的某处时停下。而原版会遍历整张表。在查找存在于集合中的元素时，排序和未排序的时间复杂度期望相同，都是O(N/2)
(define (intersection-set s1 s2)
  (if (or (null? s1) (null? s2))
      '()
      (let ((x1 (car s1))
            (x2 (car s2)))
        (cond ((= x1 x2) (cons x1
                               (intersection-set (cdr s1) (cdr s2))))
              ((< x1 x2) (intersection-set (cdr s1) s2))
              ((> x1 x2) (intersection-set s1 (cdr s2)))))))
                                        ;加速的效果非常明显，操作的步数从两集合长度的乘积变为两集合长度的和。
