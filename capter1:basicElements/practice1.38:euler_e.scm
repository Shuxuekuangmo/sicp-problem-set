(define (cont-frac n d k)
  (define (cont-frac-iter result i)
    ;(display (d i))
    ;(newline)
    (if (= i 0)
        result
        (cont-frac-iter (/ (n i)
                           (+ (d i) result))
                        (- i 1))))
  (cont-frac-iter (/ (n k) (d k)) (- k 1)))

(let ((d (lambda (i) (if (= (remainder i 3) 2)
                         (* 2 (/ (+ i 1) 3))
                         1.0)))
      (n (lambda (i) 1.0)))
  (cont-frac n d 100))
;e-2
;0.7182818284590453
