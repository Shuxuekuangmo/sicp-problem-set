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

; ------------------------------------------------

; 现有的good-enough?对很大或很小的数可能失效
(mysqrt 1e-20)
; 0.03125
(mysqrt 1e60)
; 很久未出结果

; 改进的good-enough?


(define (sqrtiter guess x preguess)
	(if (improved-good-enough? guess preguess)
		guess
		(sqrtiter (improve guess x)
			x
			guess)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average a b)
	(/ (+ a b) 2))

(define (improved-good-enough? guess preguess)
	(< 	(abs (/ (- preguess guess) guess))
		0.01))


(define (mysqrt x)
	(cond 
		((= 0 x) 0)
		((< 0 x) (sqrtiter 1.0 x 10))
		(else -1))
	)

; > (define x (mysqrt 2.567e123))
; > (square x)
; 2.5670009099730896e123

; > (define x (mysqrt 2.567e123))
; > (square x)
; 2.5670009099730896e123

; 对比较大的数和比较小的数有效了

