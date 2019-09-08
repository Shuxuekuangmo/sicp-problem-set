(define fold-right accumulate)

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))


;用fold-left和fold-right重写reverse
(define (myreverse seq)
  (fold-right (lambda (x y) (append y (list x)))
              '()
              seq))
(define (myreverse seq)
  (fold-left (lambda (x y) (cons y x))
              '()
              seq))
