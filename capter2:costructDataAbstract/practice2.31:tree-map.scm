(define (tree-map proc tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map proc subtree)
             (proc subtree)))
       tree))


(tree-map (lambda (x) (* x x)) '(1 2 3 4 (3 4 5 (5 6 7) (8 9 0))))
