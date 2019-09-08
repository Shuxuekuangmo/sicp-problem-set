(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) tolerance))
  (define (try guess)
        ; (display guess)
        ; (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;平均阻尼
(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))


;
(define (mysqrt x)
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
(define (cube-root x)
  (fixed-point (average-damp (lambda (y) (/ x (* y y)))) 1.0))


;newton method

(define dx 0.000001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx))
          (g x))
       dx)))



(define (newton-transform g)
  (lambda (x) (- x
                 (/ (g x)
                    ((deriv g) x)))))

(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))

(newton-method (lambda (x) (- (* x x) 2))
               1.0)
;1.4142135623754424


;ABSTRACT

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))


(define (mysqrt x)
  (fixed-point-of-transform (lambda (y) (/ x y)) average-damp 1.0))


(define (mysqrt x)
  (fixed-point-of-transform (lambda (y) (- (* y y) x)) newton-transform 1.0))

; ;第一级形态
; 可以用作变量名
; 可以提供给过程作为参数
; 可以由过程作为结果返回
; 可包含在数据结构中

