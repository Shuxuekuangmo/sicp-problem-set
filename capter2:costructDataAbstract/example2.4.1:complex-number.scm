(define (real-part z) '()) ;实部
(define (imag-part z) '()) ;虚部
(define (magnitude z) '()) ;模
(define (angle z) '()) ;辐角
(define (make-from-real-image real image) '())
(define (make-from-mag-ang mag ang) '())


(define (add-complex z1 z2)
  (make-from-real-image (+ (real-part z1) (real-part z2))
                        (+ (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
  (make-from-real-image (- (real-part z1) (real-part z2))
                        (- (real-part z1) (real-part z2))))


(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
                     (+ (angle z1) (angle z2))))
(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
                     (- (angle z1) (angle z2))))

                                        ;复数的底层实现
                                        ;实部虚部形式
(define (real-part x) (car x))
(define (imag-part x) (cdr x))

(define (square x) (* x x))
(define (magnitude x) (sqrt (+ (square (real-part x))
                               (square (imag-part x)))))
(define (angle x) (atan (imag-part x) (real-part x)))
(define (make-from-real-image x y) (cons x y))
(define (make-from-mag-ang m a)
  (cons (* m (cos a))
        (* m (sin a))))



                                        ;极坐标形式
(define (magnitude x) (car x))
(define (angle x) (cdr x))
(define (real-part x) (* (magnitude x) (cos (angle x))))
(define (imag-part x) (* (magnitude x) (sin (angle x))))

(define (make-from-mag-ang m a) (cons m a))

(define (make-from-real-image r i)
  (cons (sqrt (+ (square r) (square i)))
        (atan i r)))
