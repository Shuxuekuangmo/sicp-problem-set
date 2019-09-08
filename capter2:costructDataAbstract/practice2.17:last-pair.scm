(define (last-pair items)
                                        ;not empty items
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))
