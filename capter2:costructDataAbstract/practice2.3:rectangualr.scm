(define (make-point x y)
  (cons x y))

(define (x-point a) (car a))
(define (y-point a) (cdr a))


(define (print-point a)
  (newline)
  (display "(")
  (display (x-point a))
  (display ",")
  (display (y-point a))
  (display ")"))
(define a (make-point 2 9))


(define (make-segment start end)
  (cons start end))

(define (start-segment a) (car a))
(define (end-segment a) (cdr a))

(define (midpoint-segment segment)
  (make-point (/ (+ (x-point (start-segment segment))
                    (x-point (end-segment segment)))
                 2.0)
              (/ (+ (y-point (start-segment segment))
                    (y-point (end-segment segment)))
                 2.0)))





(define (make-rect a-segment b-segment)
  (cons a b))

(define (length-rect r)
  (abs (- (a-point-rect r))))
