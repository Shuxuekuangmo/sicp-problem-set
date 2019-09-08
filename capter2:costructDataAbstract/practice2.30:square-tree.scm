(define (scale-tree tree factor)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* factor tree))
        (else (cons (scale-tree (car tree) factor)
                    (scale-tree (cdr tree) factor)))))
(scale-tree (list 1 (list 3 4 5) (list 2 3 6 (list 2 3)))
            3)


(define (scale-tree tree factor)
  (map (lambda (subtree)
         (if (pair? subtree)
             (scale-tree subtree factor)
             (* factor subtree)))
       tree))


(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))


(define (square-tree tree)
  (map (lambda (tree)
         (if (pair? tree)
             (square-tree tree)
             (* tree tree)))
       tree))
