;

(define (square x) (* x x))

(define (f x y)
  (+ (* x (square (+ 1 (* x y))))
     (* y (- 1 y))
     (* (- 1 y) (+ 1 (* x y)))))


;lambda

(define (f x y)
  (define (helper a b)
    (+ (* x (square a))
       (* y b)
       (* a b)))
  (helper (+ 1 (* x y)) (- 1 y)))


(define (f x y)
  ((lambda (a b) (+ (* x (square a))
                    (* y b)
                    (* a b)))

   (+ 1 (* x y))
   (- 1 y)))

                                        ;let
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))


; (let ((var1 exp1)
;       (var2 exp2)
;       (... ...))
;   (body))

; ((lambda (var1 var2 ...) (body))
;  exp1
;  exp2
;  ...)


(define (f x y)
  (define a (+ 1 (* x y))) ;通常不这样用
  (define b (- 1 y))
  (+ (* x (square a))
     (* y b)
     (* a b)))


(define x 5)
(+ (let ((x 3))
     (+ x (* x 10)))
   x) ;38

(define x 2)
(let ((x 3)
      (y (+ x 2)));这里的x是外部的
  (+ (* x 10) y)) ;34
