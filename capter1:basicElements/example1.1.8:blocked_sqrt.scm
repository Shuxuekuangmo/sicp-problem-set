
(define (mysqrt x)
	(define (sqrtiter guess preguess)
		(if (improved-good-enough? guess preguess)
			guess
			(sqrtiter (improve guess)
				x
				guess)))

	(define (improve guess)
		(average guess (/ x guess)))

	(define (average a b)
		(/ (+ a b) 2))

	(define (improved-good-enough? guess preguess)
		(< 	(abs (/ (- preguess guess) guess))
			0.01))
	(cond 
		((= 0 x) 0)
		((< 0 x) (sqrtiter 1.0 x 10))
		(else -1))
)