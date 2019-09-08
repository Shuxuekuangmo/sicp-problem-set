(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (* tree tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))))))

(define (fib n)
        (define (fibiter a b count)
                (cond ((= count 0) a)
                      (else (fibiter b (+ a b) (- count 1)))))
        (fibiter 0 1 n))


(define (even-fibs n)
  (define (next k)
    (if (> k n)
        '()
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))))))
  (next 0))

                                        ;过滤一个序列

(define (filter predicate sequence)
  (cond ((null? sequence) '())
        ((predicate (car sequence)) (cons (car sequence)
                                          (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

                                        ;积累工作

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

                                        ;枚举一个序列
                                        ;这里是生成一个整数数列


(define (enumrate-interval low high)
  (if (> low high)
      '()
      (cons low
            (enumrate-interval (+ low 1) high))))


                                        ;枚举一棵树的所有树叶


(define (enumrate-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (list tree))
        (else (append (enumrate-tree (car tree))
                      (enumrate-tree (cdr tree))))))


                                        ;重新构造的sum-odd-squares和even-fib

(define (sum-odd-squares tree)
  (accumulate +
              0
              (map (lambda (x) (* x x))
                   (filter odd?
                           (enumrate-tree tree)))))

(define (even-fibs n)
  (accumulate cons
              '()
              (filter even?
                      (map fib
                           (enumrate-interval 0 n)))))


                                        ;前N+1个斐波那契数的平方
(define (list-fib-square n)
  (map (lambda (x) (* x x))
       (map fib
            (enumrate-interval 0 n))))

                                        ;序列中所有奇数平方之乘积
(define (product-of-square-of-odd-elements-in-sequence sequence)
  (accumulate *
              1
              (map (lambda (x) (* x x))
                   (filter odd?
                           sequence))))
