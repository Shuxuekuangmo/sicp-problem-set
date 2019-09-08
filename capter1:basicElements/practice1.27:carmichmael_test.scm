(define (square x) (* x x))


(define (expmod base exp mod)
        (cond
                ((= exp 0) 1)
                ((even? exp) (remainder (square (expmod base (/ exp 2) mod)) mod))
                (else (remainder (* base (expmod base (- exp 1) mod)) mod))))
(define (carmichale-test n)
  (define (test-iter a)
    (cond ((= a 1) #t)
          ((= (expmod a n n) (test-iter (- a 1)))
          (else #f)))
  (test-iter (- n 1)))
                                        ;素数与carmichale数都会得到#t,合数得到#f
