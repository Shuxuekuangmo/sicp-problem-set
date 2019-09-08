(define (repeated f n)
  (if (= n 1)
      f
      (lambda (x)
        ((repeated f (- n 1)) (f x)))))

(define (square x) (* x x))

(define dx 0.000001)
(define (smooth f)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3.0)))

(define (smooth-n f n)
  ((repeated smooth n) f))
((smooth-n square 10) 10)
