;R
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

;I
(define (accumulate combiner null-value term a next b)
  (define (accumulate-iter result a b)
    (if (> a b)
        result
        (accumulate-iter (combiner (term a) result) (next a) b)))
  (accumulate-iter null-value a b))



(define (sum-term term a next b) (accumulate + 0 term a next b))
(define (product-term term a next b) (accumulate * 1 term a next b))
