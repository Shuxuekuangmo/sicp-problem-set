(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumrate-interval 1 (- i 1))))
           (enumrate-interval 1 n)))

                                        ;用unique-pairs化简的prime-sum-pairs

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
