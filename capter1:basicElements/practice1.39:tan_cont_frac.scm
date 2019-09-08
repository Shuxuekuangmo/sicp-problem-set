;lambert formular



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


(define (tan-cf x k)
  (define sq (- (* x x)))
  (let ((n (lambda (i) (if (= i 1)
                           x
                           sq)))
        (d (lambda (i) (- (* i 2) 1))))
    (cont-frac n d k)))
(tan-cf 1.0 100)
;1.557407724654902
(tan 1)
;1.5574077246549023
