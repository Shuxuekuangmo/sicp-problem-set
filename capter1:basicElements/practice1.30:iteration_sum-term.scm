(define (sum-term term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-term term (next a) next b))))

(define (sum-term term a next b)
  (define (sum-iter result a b)
    (if (> a b)
        result
        (sum-iter (+ result (term a)) (next a) b)))
  (sum-iter 0 a b))
