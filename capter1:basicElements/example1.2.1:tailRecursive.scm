
; 普通递归

(define (factorial n)
	(if (= 1 n)
		1
		(* (factorial (- n 1)) n)))


; 尾递归

(define (factorial-tail n)

	(define (factorial-iter n product)
	(if (= 1 n)
		product
		(factorial-iter (- n 1) (* product n))))

	(factorial-iter n 1))


