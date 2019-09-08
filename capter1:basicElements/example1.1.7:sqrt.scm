(define (sqrtiter guess x)
	(if (good-enough? guess x)
		guess
		(sqrtiter (improve guess x)
			x)))

(define (improve guess x)
	(average guess (/ x guess)))
(define (average a b)
	(/ (+ a b) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))

(define (mysqrt x)
	(sqrtiter 1.0 x))
