
; T_pq->(b,a+b)
; a=b,b=a+b
; a=b*p+a*q	b=b*q+a*q+a*p  (p=0,q=1)




(define (fast-fib n)
  (define (fib-iter a b p q n)
    (cond
       ((= 0 n) b)
     ((even? n) (fib-iter 
                 a
                 b
                 (+ (* p p) (* q q))
                 (+ (* q q) (* 2 p q))
                 (/ n 2)))
     (else (fib-iter
            (+ (* a p) (* a q) (* b q))
            (+ (* b p) (* a q))							
            p
            q
            (- n 1)))))
  (fib-iter 0 1 0 1 n))
