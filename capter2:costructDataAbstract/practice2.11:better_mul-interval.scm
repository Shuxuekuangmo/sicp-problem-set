(define (mul-interval x y)
  (cond ((and (< (* (lower-bound x) (upper-bound x)) 0)
              (< (* (lower-bound y) (upper-bound y)) 0))
         (let ((p1 ()))))))
