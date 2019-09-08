(define (element-of-set? elem set)
  (cond ((null? set) #f)
        ((equal? elem (car set)) #t)
        (else (element-of-set? elem (cdr set)))))

(define (adjoin-set elem set)
  (if (element-of-set? elem set)
      set
      (cons elem set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1)
                                                 (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;:filter版本

(define (intersection-set s1 s2)
  (filter (lambda (x) (element-of-set? x s1)) s2))
