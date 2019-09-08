
(define (inc n)
	(+ n 1))
(define (dec n)
	(- n 1))

(define (sum a b)
	(if (= a 0)
		b
		(inc (sum (dec a) b))))

(define (sum a b)
	(if (= a 0)
		b
		(sum (dec a) (inc b))))

; 两个过程在形式上都是递归的，但在计算过程中，第二个是迭代的
