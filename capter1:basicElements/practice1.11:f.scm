
(define (f n)
	(cond 
		((< n 3) n)
		(else (+ 
			(f (- n 1)) 
			(* 2 (f (- n 2))) 
			(* 3 (f (- n 3)))))))

; 将上函数改写成尾递归的形式

(define (f n)
	(define (f-iter a b c i)
		(if (= n i)
			a
			(f-iter b c (+ c (* b 2) (* a 3)) (+ i 1))))
	(f-iter 0 1 2 0))

