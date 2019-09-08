

; sin(x)~=3*sin(x/3)-4*sin(x/3)^3

(define (mysin x)
	(define (cube x) (* x x x))
	(define (f x) (- (* 3 x) (* 4 (cube x))))
	(define (sine x)
		(if (< (abs x) 0.1)
			x
			(f (sine (/ x 3)))))
	(sine x))

; (a)：
; (b)：
