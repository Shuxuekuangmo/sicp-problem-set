                                        ;

(define (mymap p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              '()
              sequence))

                                        ;注意和append添加的顺序一致

(define  (myappend a b)
  (accumulate cons
              b
              a))
(define (mylength sequence)
  (accumulate (lambda (x y) (+ 1 y))
              0
              sequence))
