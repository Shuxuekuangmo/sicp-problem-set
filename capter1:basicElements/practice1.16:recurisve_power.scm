; 书上改进形式的尾递归版本
(define (fast-power x n)
	(define (fast-power-iter x product n)
		(cond 
			((= 0 n) product)
			((even? n) (fast-power-iter (* x x) product (/ n 2)))	;将书上这一部分改成尾递归的
			(else (fast-power-iter x (* x product) (- n 1)))))

	(fast-power-iter x 1 n))