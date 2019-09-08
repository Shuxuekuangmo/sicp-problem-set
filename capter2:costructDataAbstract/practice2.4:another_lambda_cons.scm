(define (mycons x y)
  (lambda (m) (m x y)))

(define (mycar con)
  (con (lambda (x y) x)))

(define (mycdr con)
  (con (lambda (x y) y)))


(define a (mycons 1 2))
(define b (mycons 3 a))

(display (mycar b))
(newline)
(display (mycar (mycdr b)))
(newline)
(display (mycdr (mycdr b)))
