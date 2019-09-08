(define (make-accumulator num)
  (lambda (x)
    (begin (set! num (+ num x))
           num)))


(define a (make-accumulator 10))
(a 5)
(a 3)
