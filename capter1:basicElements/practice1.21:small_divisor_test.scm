(define (smallest-divisor n)
        (define (find-divisor n test-divisor)
                (cond
                        ((> (* test-divisor test-divisor) n) n)
                        ((= (remainder n test-divisor) 0) test-divisor)
                        (else (find-divisor n (+ test-divisor 1)))))

        (find-divisor n 2))


(smallest-divisor 199)
(smallest-divisor 1999)
(smallest-divisor 19999)
