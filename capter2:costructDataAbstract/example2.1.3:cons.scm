(define (mycons x y)
  (lambda (a)
    (if (= 0 a)
        x
        y)))

(define (mycar con)
  (con 0))
(define (mycdr con)
  (con 1))


(define a (mycons 1 2))
(display (mycar a))
(newline)
(display (mycdr a))
