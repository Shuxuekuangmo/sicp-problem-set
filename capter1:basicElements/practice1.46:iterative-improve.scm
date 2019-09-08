(define (improve guess x)
        (average guess (/ x guess)))
(define (average a b)
        (/ (+ a b) 2))

(define (good-enough? guess x)
        (< (abs (- (square guess) x)) 0.001))
(define (square x) (* x x))

(define (mysqrt x)
        (sqrtiter 1.0 x))



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


;-----------------------------------------------------
(define (iterative-improve good-enough? improve)
  (lambda (first-guess)
    (define (try guess)
      (let ((next (improve guess)))
        (if (good-enough? guess next)
            next
            (try next))))
    (try first-guess)))



(define (mysqrt x)
  (define (good-enough? a b)
    (< (abs (- a b)) 0.00001))
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2.0))

  ((iterative-improve good-enough? improve) 1.0))


(define (fixed-point f first-guess)
  (define tolerance 0.0000001)
  (define (good-enough? a b)
    (< (abs (- a b))
       tolerance))
  (define (improve x)
    (f x))

  ((iterative-improve good-enough? improve) first-guess))
