; 假设只能用加法的形式来完成乘法
; 例
(define (multip a b)
	(if (= 0 b)
		0
		(+ a (multip a (- b 1))))

; 给出如下两个函数
(define (halve n) (/ n 2)) ;要求n是偶数
(define (double n) (+ n n))


; -----------------------------------------------
(define (fast-multip a b)
	(define (halve n) (/ n 2)) ;要求n是偶数
	(define (double n) (+ n n))

	(cond 
		((= 0 b) 0)
		((even? b) (double (fast-multip a (halve b))))
		(else (+ a (fast-multip a (- b 1)))))
)
