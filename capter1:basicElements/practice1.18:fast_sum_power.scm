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
; 迭代形式
(define (fast-recurisve-multip a b)
	(define (halve n) (/ n 2)) ;要求n是偶数
	(define (double n) (+ n n))

	(define (multip-iter product a b)
		(cond 
			((= b 0) product)
			((even? b) (multip-iter product (double a) (halve b)))
			(else (multip-iter (+ a product) a (- b 1)))))
	(multip-iter 0 a b)
)
