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

;Æ½¾ù×èÄá
(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))

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

;--------------------------------------------------

(define (cube x) (* x x x))
(define (square x) (* x x))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newton-method (cubic 1 2 3) 1.0)
