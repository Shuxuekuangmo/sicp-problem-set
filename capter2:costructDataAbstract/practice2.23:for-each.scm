(define (myfor-each proc items)
  (if (null? items)
      #t
      (begin
        (proc (car items))
        (myfor-each proc (cdr items)))))
