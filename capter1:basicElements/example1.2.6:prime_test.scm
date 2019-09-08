
(define (smallest-divisor n)
	(define (find-divisor n test-divisor)
		(cond
			((> (* test-divisor test-divisor) n) n)
			((= (remainder n test-divisor) 0) test-divisor)
			(else (find-divisor n (+ test-divisor 1)))))

	(find-divisor n 2))


(define (prime? n)
	(= n (smallest-divisor n)))



(define (square x) (* x x))


(define (expmod base exp mod)
	(cond 
		((= exp 0) 1)
		((even? exp) (remainder (square (expmod base (/ exp 2) mod)) mod))
		(else (remainder (* base (expmod base (- exp 1) mod)) mod))))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))


(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) fast-prime? n (- times 1))
        (else false)))
 ; 能骗过费马检查的数称为carmichael数，非常罕见
; 100 000 000 内有 255个，其中有 561 1105 1729 2465 2821 6601


