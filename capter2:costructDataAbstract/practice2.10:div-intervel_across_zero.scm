(define (div-interval x y)
  (if (<= 0 (* (upper-bound y) (lower-bound y)))
      (error "can not div interval span 0")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))
