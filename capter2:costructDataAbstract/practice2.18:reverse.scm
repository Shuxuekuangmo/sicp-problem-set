(define (myreverse items)
  (define (iter ite rev)
    (if (null? ite)
        rev
        (iter (cdr ite) (cons (car ite) rev))))
  (iter items '()))
