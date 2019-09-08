(define x 1)
(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x) (square y)))
(+ 1 2)

(cond ((> x 1)  1)
	((< x 1) -1)
	((= x 1) 0))

; 1.2
(/	(+ 5 4 (- 2 (- 3 (+ 6 (/ 4.0 5)))))
	(* 3 (- 6 2) (- 2 7)))

; 1.3
(define (maxsum x y z)
	(max (+ x y) (max (+ x z) (+ y z))))
;1.4
(define (a-plus-abs-b a b)
	((if (> b 0) + -) a b))
; 1.5

; 验证应用序与正则序

(define (p) (p))

(define (test0 x y)
	(if (= x 0)
		0
		y))
; 死循环，可能因为对参数求值而不是因为正则序，因为下面的test能够求出0
(define (test1 x y)
	(if (= x 0)
		0
		(p)))
; 说明是应用序而不是正则序
