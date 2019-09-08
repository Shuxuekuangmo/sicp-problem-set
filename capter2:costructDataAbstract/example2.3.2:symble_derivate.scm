(define (variable? e))
(define (same-variable? v1 v2))
(define (sum? e))
(define (product? e))
(define (addend e))
(define (augend e))
(define (make-sum a1 a2))

(define (multiplier e))
(define (multiplicand e))
(define (make-product m1 m2))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (not (same-variable? exp var))
                             0
                             1))
        ((sum? exp) (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp) (make-sum (make-product (multiplier exp)
                                                (deriv (multiplicand exp) var))
                                  (make-product (multiplicand exp)
                                                (deriv (multiplier exp) var))))
        (else (error "unknown expression type -- DERIV" exp))))


                                        ;实现

(define (variable? e) (symbol? e))
(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (make-sum a1 a2)
  (list '+ a1 a2))
(define (make-product m1 m2)
  (list '* m1 m2))
(define (sum? x) (and (pair? x) (eq? (car x) '+)))
(define (product? x) (and (pair? x) (eq? (car x) '*)))
(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (multiplier s) (cadr s))
(define (multiplicand s) (caddr s))

; > (deriv '(+ x 3) 'x)
; (+ 1 0)
; > (deriv '(+ x y) 'x)
; (+ 1 0)
; > (deriv '(* x y) 'x)
; (+ (* x 0) (* y 1))
; > (deriv '(* (* x y) (+ x 3)) 'x)
; (+ (* (* x y) (+ 1 0)) (* (+ x 3) (+ (* x 0) (* y 1))))


                                        ;解决0 1 没有化简的问题
(define (=number? a b)
  (and (number? a) (number? b) (= a b)))
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))

(define (make-product m1 m2)
  (cond ((or (=number? 0 m1) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (+ m1 m2))
        (else (list '* m1 m2))))
; > (deriv '(* (* x y) (+ x 3)) 'x)
; (+ (* x y) (* (+ x 3) y))
