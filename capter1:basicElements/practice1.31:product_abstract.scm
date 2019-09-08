;R
(define (product-term term a next b)
  (if (> a b)
      1
      (* (term a) (product-term term (next a) next b))))
;I
(define (product-term term a next b)
  (define (product-iter product a b)
    (if (> a b)
        product
        (product-iter (* product (term a)) (next a) b)))
  (product-iter 1 a b))


                                        ;pi/4
(define (square x) (* x x))
(define (term a)
  (/ (* a (+ a 2))
     (square (+ a 1))))

(define (next a) (+ a 2))


(* 4 (product-term term 2.0 next 100))
