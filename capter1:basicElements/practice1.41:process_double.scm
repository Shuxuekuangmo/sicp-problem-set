(define (double f)
  (lambda (x) (f (f x))))

(define (inc n) (+ n 1))

(((double (double double)) inc) 0)
;16
;((double f) x) == (f (f x))
;(((double double) f) x) == ((double (double f)) x) == ((double f) ((double f) x)) == (f (f (f (f x))))

;(((double (double double)) f) x) == (((double double) ((double double) f)) x) == (((double double) f) (((double double) f) (((double double) f) (((double double) f) x))))

(((double (double (double double))) inc) 0)
;256
