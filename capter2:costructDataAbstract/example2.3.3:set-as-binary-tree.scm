(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (make-tree entry left right) (list entry left right))
(define (element-of-set? x s)
  (cond ((null? s) #f)
        ((= x (entry s)) #t)
        ((< x (entry s)) (element-of-set? x (left-branch s)))
        ((> x (entry s)) (element-of-set? x (right-branch s)))))


(define (adjoin x set)
  (cond ((null? set) (make-tree x '() '()))
        ((= x (entry set)) set)
        ((< x (entry set)) (make-tree (entry set)
                                      (adjoin x (left-branch set))
                                      (right-branch set)))
        ((> x (entry set)) (make-tree (entry set)
                                      (left-branch set)
                                      (adjoin x (right-branch set))))))
                                        ;wryyyyyyyyyyyyyyyyyyyyyyyyyyyy
