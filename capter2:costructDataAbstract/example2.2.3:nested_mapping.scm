(accumulate append
            '()
            (map (lambda (i)
                   (map (lambda (j)
                          (list i j))
                        (enumrate-interval 1 (- i 1))))
                 (enumrate-interval 1 6)))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))


(define (smallest-divisor n)
        (define (find-divisor n test-divisor)
                (cond
                        ((> (* test-divisor test-divisor) n) n)
                        ((= (remainder n test-divisor) 0) test-divisor)
                        (else (find-divisor n (+ test-divisor 1)))))

        (find-divisor n 2))


(define (prime? n)
  (= n (smallest-divisor n)))


(define (prime-sum? pair)
  (prime? (+ (car pair)
             (cadr pair))))
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap (lambda (i) (map (lambda (j) (list i j))
                                         (enumrate-interval 1 (- i 1))))
                        (enumrate-interval 1 n)))))


(define (remove elem set)
  (filter (lambda (x) (not (= x elem)))
          set))

(define (permutations seq)
  (if (null? seq)
      (list '())
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x seq))))
               seq)))
