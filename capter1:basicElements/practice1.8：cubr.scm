
(define (cubriter guess x preguess)
	(if (improved-good-enough? guess preguess)
		guess
		(cubriter (improve guess x)
			x
			guess)))

(define (improve guess x)
	(/
		(+
			(/ x (square guess))
			(* 2 guess))
		3))


(define (improved-good-enough? guess preguess)
	(< 	(abs (/ (- preguess guess) guess))
		0.01))


(define (mycubr x)
	(cond 	((= 0 x) 0)
			(else (cubriter 1.0 x 10))))