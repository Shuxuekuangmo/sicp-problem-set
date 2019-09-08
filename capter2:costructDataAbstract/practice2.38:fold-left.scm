                                        ;accumulate也被称为fold-right：将第一个元素组合到右边元素的组合结果上。而fold-left从反方向操作各个元素

(define fold-right accumulate)

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))
                                        ;fold-right的本质是递归，init作为右操作值第一个参与运算
                                        ;fold-left的本质是迭代，init作为左操作值第一个参与运算

                                        ;/
                                        ;)
(fold-right / 1 '(1 2 3))
;(1/(2/(3/1))) -> 3/2
(fold-left / 1 '(1 2 3))
;1/1/2/3  -> 1/6
(fold-right list '() '(1 2 3))
;(1 (2 (3 ())))
(fold-left list '() '(1 2 3))
;(((() 1) 2) 3)

;如果要求某个op对fold-right或left产生同样的效果，需要op具有交换性
