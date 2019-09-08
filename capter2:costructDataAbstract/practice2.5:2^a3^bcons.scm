(define (mycons x y)
  (* (expt 2 x)
     (expt 3 y)))
;R
(define (mycar con)
  (cond ((= 0 con) 0)
        ((= 0 (remainder con 2)) (+ 1 (mycar (/ con 2))))
        (else 0)))

(define (mycdr con)
  (cond ((= 0 con) 0)
        ((= 0 (remainder con 3)) (+ 1 (mycdr (/ con 3))))
        (else 0)))
;I
(define (mycar con)
  (define (iter remaind n)
    (cond ((= remaind 0) n)
          ((= (remainder remaind 2) 0) (iter (/ remaind 2) (+ n 1)))
          (else n)))
  (iter con 0))


(define (mycdr con)
  (define (iter remaind n)
    (cond ((= remaind 0) n)
          ((= (remainder remaind 3) 0) (iter (/ remaind 3) (+ n 1)))
          (else n)))
  (iter con 0))

(define a (mycons 1 2))
(define b (mycons 3 a))

(display (mycar b))
(newline)
(display (mycar (mycdr b)))
(newline)
(display (mycdr (mycdr b)))

