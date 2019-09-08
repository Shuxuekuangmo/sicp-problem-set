(define (attach-tag tag con)
  (cons tag con))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "bad tagged datum --TYPE-TAG" datum)))



(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "bad tagged datum --CONTENTS" datum)))

(define (rectangular? z)
  (eq? 'rectangular (type-tag z)))
(define (polar? z)
  (eq? 'polar (type-tag z)))

                                        ;rectangular


(define (real-part-rectangular x) (car x))

(define (imag-part-rectangular x) (cdr x))

(define (square x) (* x x))

(define (magnitude-rectangular x) (sqrt (+ (square (real-part-rectangular x))
                                           (square (imag-part-rectangular x)))))
(define (angle-rectangular x) (atan (imag-part-rectangular x)
                                    (real-part-rectangular x)))

(define (make-from-real-image-rectangular r i)
  (attach-tag 'rectangular (cons r i)))

(define (make-from-mag-ang-rectangular m a)
  (attach-tag 'rectangular (cons (* m (cos a))
                                 (* m (sin a)))))



                                        ;polar
(define (magnitude-polar x) (car x))
(define (angle-polar x) (cdr x))
(define (real-part-polar x) (* (magnitude-polar x) (cos (angle-polar x))))
(define (imag-part-polar x) (* (magnitude-polar x) (sin (angle-polar x))))

(define (make-from-mag-ang-polar m a)
  (attach-tag 'polar (cons m a)))

(define (make-from-real-image-polar r i)
  (attach-tag 'polar (cons (sqrt (+ (square r) (square i)))
                           (atan i r))))


(define (real-part z)
  (cond ((rectangular? z)
         (real-part-rectangular (contents z)))
        ((polar? z)
         (real-part-polar (contents z)))
        (else (error "unknown type --REAL-PART" z))))

(define (imag-part z)
  (cond ((rectangular? z)
         (imag-part-rectangular (contents z)))
        ((polar? z)
         (imag-part-polar (contents z)))
        (else (error "unknown type --IMAG-PART" z))))

(define (magnitude z)
  (cond ((rectangular? z)
         (magnitude-rectangular (contents z)))
        ((polar? z)
         (magnitude-polar (contents z)))
        (else (error "unknown type --MAGNITUDE" z))))

(define (angle z)
  (cond ((rectangular? z)
         (angle-rectangular (contents z)))
        ((polar? z)
         (angle-polar (contents z)))
        (else (error "unknown type --ANGLE" z))))

(define (make-from-real-image r m)
  (make-from-real-image-rectangular r m))

(define (make-from-mag-ang m a)
  (make-from-mag-ang-polar m a))
