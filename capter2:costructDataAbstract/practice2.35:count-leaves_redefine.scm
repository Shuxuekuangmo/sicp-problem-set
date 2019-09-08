                                        ;count-leaves in 2.2.2
(define (count-leaves items)
  (cond ((null? items) 0)
        ((not (pair? items)) 1)
        (else (+ (count-leaves (car items))
                 (count-leaves (cdr items))))))

(define (count-leaves items)
  (accumulate (lambda (x y) (+ (length x) y))
              0
              (map enumrate-tree
                   items)))
