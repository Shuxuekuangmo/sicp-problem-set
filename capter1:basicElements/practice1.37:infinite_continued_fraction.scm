;R
(define (cont-frac n d k)
  (define (cont-frac-iter i)
    (if (= k i)
        (/ (n k) (d k))
        (/ (n i) (+ (d i)
                    (cont-frac-iter (+ i 1))))))
  (cont-frac-iter 1))

(cont-frac (lambda (x) 1.0)
           (lambda (x) 1.0)
           100)
;0.6180339887498948

;多大的k才能使得到的值具有十进制的4位精度？
;I

(define (cont-frac n d k)
  (define (cont-frac-iter result i)
    (if (= i 0)
        result
        (cont-frac-iter (/ (n i)
                           (+ (d i) result))
                        (- i 1))))
  (cont-frac-iter (/ (n k) (d k)) (- k 1)))
