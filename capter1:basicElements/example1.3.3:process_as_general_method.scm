;half fold

(define (search f neg-point pos-point)
  (define (average x y) (/ (+ x y) 2.0))
  (define (close-enough? x y) (< (abs (- x y)) 0.0001))
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value) (search f neg-point midpoint))
                ((negative? test-value) (search f midpoint pos-point))
                (else midpoint))))))

(define (half-interval-method  f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (positive? a-value) (negative? b-value)) (search f b a))
          ((and (positive? b-value) (negative? a-value)) (search f a b))
          ((= a-value 0) a)
          ((= b-value 0) b)
          (else (error "values are not of opposite sign" a b)))))

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point cos 1.0);0.7390822985224024

(fixed-point (lambda (x) (+ (sin x) (cos x))) 1.0);1.2587315962971173

;计算平方根可以转化为寻找不动点的问题
;y^2=x -> y=x/y

(define (mysqrt x)
  (fixed-point (lambda (y) (/ x y)) 1.0))
; 求不出结果，会死循环
;guess=y1 -> y2=x/y1 -> y3=x/(x/y1)=y1 死循环

(define (average x y) (/ (+ x y) 2.0))
;y^2=x -> y=x/y -> 2y=x+x/y -> y=(y+x/y)/2)
(define (mysqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))
