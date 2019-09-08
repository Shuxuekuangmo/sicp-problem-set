                                        ;Abstract

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (cube n) (* n n n))

(define (sum-cubes a b)

  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))


(define (sum-pi a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* (+ a 2) a)) (sum-pi (+ a 4) b))))

                                        ;共有模式

(define (sum-term term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-term term (next a) next b))))


                                        ;积分的实现

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* dx
     (sum-term f (+ a (/ dx 2.0)) add-dx b)))
