; 新的if的定义
(define (new-if predicate than-cpndition else-condition)
	(cond (predicate than-cpndition)
		(else else-condition)))

; 用新的if重写sqrt
(define (sqrtiter guess x)
	(new-if (good-enough? guess x)
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
; 用新的sqrt开平方根的结果是死循环
; 原本的if的特性在于先对谓词部分求值，然后根据谓词部分的值求所对应的表达式的值
; 然而普通函数会先对所有的参数求值，这导致了迭代的迭代无法终止

(define (p) (p))

(if 1
	0
	(p))
; 0
(new-if 1
	0
	(p))
; 死循环
