
; 斐波那契数列
(define (fib n)
	(cond 
		((= n 0) 0)
		((= n 1) 1)
		(else (+ (fib (- n 1)) (fib (- n 2))))))

; 迭代版本
(define (fib n)
	(define (fibiter a b count)
		(cond ((= count 0) a)
			(else (fibiter b (+ a b) (- count 1)))))
	(fibiter 0 1 n))


; 兑换零钱的递归：
; 有半美元、四分之一美元、十美分、五美分和一美分的硬币
; 将一美元兑换成零钱，有几种兑法

(define (change amount)
	(define (first-demination kind-of-coins)
		(cond
			((= kind-of-coins 1) 1)
			((= kind-of-coins 2) 5)
			((= kind-of-coins 3) 10)
			((= kind-of-coins 4) 25)
			((= kind-of-coins 5) 50)))
	(define (cc amount n)
		(cond 
			((or (< amount 0) (= n 0)) 0)
			((= amount 0) 1)
			(else (+
					(cc amount (- n 1))
					(cc (- amount (first-demination n)) n)))))
	(cc amount 5))

; > (change 100)
; 292
