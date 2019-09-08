(define (repeated f n)
  (if (= n 0)
      (lambda (x) x)
      (lambda (x)
        ((repeated f (- n 1)) (f x)))))

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

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2.0)))


(define (power x n)
  (if (= n 0)
      1
      (* x (power x (- n 1)))))


;y^2=x y=x/y
(define (mysqrt x)
  ;(fixed-point (lambda (y) (/ x y)) 1.0)
  ;求不出结果
  ;一次平均阻尼后
  (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
;y^3=x y=x/y^2
(define (mycubrt x)
  ;(fixed-point (lambda (y) (/ x y y)) 1.0)
  (fixed-point (average-damp (lambda (y) (/ x y y))) 1.0))

;y^4=x y=x/y^3
(define (fourt x)
  ;(fixed-point (lambda (y) (/ x y y y)) 1.0)
  ; (fixed-point ((repeated average-damp 1) (lambda (y) (/ x y y y))) 1.0)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (power y 3)))) 1.0))


(define (rt n a)
  (lambda (x)
    (fixed-point ((repeated average-damp a) (lambda (y)

                                              (/ x (power y (- n 1)))))
                 1.0)))
; 1 1
; 2 1
; 3 1
; 4 2
; 5 2
; 6 2
; 7 2
; 8 3
; 9 3
; 10  3
; 11  3
; 12  3
; 13  3
; 14  3
; 15  3
; 16  4
; 17  4
; 18  4
; 19  4
; 20  4
; 21  4
; 22  4
; 23  4
; 24  4
; 25  4
; 26  4
; 27  4
; 28  4
; 29  4
; 30  4
; 31  4
; 32  5
; 33  5
; 34  5
; .......

(define (root-n x n)
  (define (times n)
      (define (iter i)
        (if (> (power 2 i) n)
            (- i 1)
            (iter (+ i 1))))
      (if (= n 1)
          1
          (iter 0)))

    ((rt n (times n)) x))

(root-n 156 13)
;1.4746968133193685
(power 1.4746948 13)
;156.00119861651302
