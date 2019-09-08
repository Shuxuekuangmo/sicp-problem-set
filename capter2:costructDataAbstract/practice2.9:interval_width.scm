(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (upper-bound x) (max (car x) (cdr x)))
(define (lower-bound x) (min (car x) (cdr x)))
(define (print-interval x)
  (display "(")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display ")")
  (newline))

(define (width-interval a)
  (/ (- (upper-bound a) (lower-bound a)) 2.0))



(define a (make-interval 1 2))
(define b (make-interval 3 4))

(define c (add-interval a b))
(define d (mul-interval a b))
(define e (div-interval a b))
(define f (sub-interval a b))

(define wa (width-interval a))
(define wb (width-interval b))

(display (= (width-interval c)
            (+ wa wb)))

(display (= (width-interval f)
            (+ wa wb)))

(display (= (width-interval c)
            (* wa wb)))
(display (= (width-interval d)
            (/ wa wb)))


; a = (la,ua)
; b = (lb,ub)

; wa=(ua-la)/2
; wb=(ub-lb)/2

; a+b = (la+lb,ua+ub)
; w=(ua+ub-la-lb)/2=wa+wb
; a-b = (la-ub,ua-lb)
; w=(abs (ua+ub-la-lb)/2)=wa+wb

; For multiplication and division, the story is different. If the width of the result was a function of the widths of the inputs, then multiplying different intervals with the same widths should give the same answer. For example, multiplying a width 5 interval with a width 1 interval:

;   [0, 10] * [0, 2] = [0, 20]   (width = 10)
; The following intervals have the same widths as the corresponding ones above, but multiplying gives different results:

;   [-5, 5] * [-1, 1] = [-5, 5]   (width = 5)