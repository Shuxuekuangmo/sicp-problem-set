(define (make-rat n d) (cons n d))
(define (number x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (number x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (number x) (denom y))
               (* (number y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (add-rat x (make-rat (- (number y)) (denom y))))

(define (mul-rat x y)
  (make-rat (* (number x) (number y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (number x) (denom y))
            (* (number y) (denom x))))
(define (equal-rat? x y)
  (= (* (number x) (denom y))
     (* (number y) (denom x))))


(define one-half (make-rat 1 2))
(define one-third (make-rat 1 3))

(print-rat one-half)

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))


(define (GCD a b)
        (if (= b 0)
                a
                (GCD b (remainder a b))))

(define (make-rat x y)
  (let ((g (GCD x y)))
    (cons (/ x g) (/ y g))))

(print-rat (add-rat one-third one-third))
