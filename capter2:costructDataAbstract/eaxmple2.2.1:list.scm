(define (list-ref item n)
  (if (= 0 n)
      (car item)
      (list-ref (cdr item) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1
         (length (cdr items)))))

(define (length items)
  (define (iter list n)
    (if (null? list)
        n
        (iter (cdr list) (+ n 1))))
  (iter items 0))

(define (myappend list1 list2)
  (if (null? list1)
      list2
      (cons (car list1)
            (myappend (cdr list1) list2))))

(define (mymap proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (mymap proc (cdr items)))))
