;R
(define (filtered-accumulate filter combiner null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate filter combiner null-value term (next a) next b)))
        (else (filtered-accumulate filter combiner null-value term (next a) next b))))
;I
(define (filtered-accumulate filter combiner null-value term a next b)
  (define (fa-iter result a b)
    (cond ((> a b) result)
          ((filter a) (fa-iter (combiner result (term a)) (next a) b))
          (else (fa-iter result (next a) b))))
  (fa-iter null-value a b))


;(a)
;prime sum

(define (smallest-divisor n)
        (define (find-divisor n test-divisor)
                (cond
                        ((> (* test-divisor test-divisor) n) n)
                        ((= (remainder n test-divisor) 0) test-divisor)
                        (else (find-divisor n (+ test-divisor 1)))))

        (find-divisor n 2))


(define (prime? n)
  (= n (smallest-divisor n)))

(define (filter a) (prime? a))
(define (term a) a)
(define (next a) (+ a 1))

(filtered-accumulate filter + 0 term 2 next 100)
;1060

(define (primesum a b)
  (cond ((> a b) 0)
        ((prime? a) (+ a (primesum (+ a 1) b)))
        (else (primesum (+ a 1) b))))
;1060




;(b)
;小于n且和n互素的数的乘积

(define (GCD a b)
        (if (= b 0)
                a
                (GCD b (remainder a b))))

(define (filter n)
  (lambda (a) (= (GCD a n) 1)))

(define (term a) a)
(define (next a) (+ a 1))

(filtered-accumulate (filter 100) * 1 term 2 next 100)
;426252881942771063138176712755660145456313428952105524817872601

(define (priproduct a b)
  (cond ((> a b) 1)
        ((= (GCD a b) 1) (* a (priproduct (+ a 1) b)))
        (else (priproduct (+ a 1) b))))

(priproduct 2 100)
; 426252881942771063138176712755660145456313428952105524817872601
