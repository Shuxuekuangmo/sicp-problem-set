(define (GCD a b)
        (if (= b 0)
                a
                (GCD b (remainder a b))))

(define (make-rat x y)
  (let ((g (GCD x y)))
    (cond ((negative? y) (cons (- x) (- y)))
          (else (cons x y)))))
