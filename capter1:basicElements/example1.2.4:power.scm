
(define (power x n)
	(if (= 0 n)
		1
		(* x (power x (- n 1)))))

;尾递归版本
(define (power x n)
	(define (power-iter result i)
		(if (= n i)
			result
			(power-iter (* result x) (+ i 1))))
	(power-iter 1 0))

; 改进
(define (power x n)
	
	(define (square x) (* x x))
	(cond 
		((= n 0) 1)
		((odd? n) (* x (power x (- n 1))))
		(else (square (power x (/ n 2)))))
)

