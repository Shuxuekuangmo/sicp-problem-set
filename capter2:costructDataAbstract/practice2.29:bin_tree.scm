(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


(define (left-branch x)
  (car x))
(define (right-branch x)
  (car (cdr x)))

(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (car (cdr branch)))


(define (total-weight x)
  (cond ((null? x) 0)
        ((not (pair? x)) x)
        (else (+ (total-weight (branch-structure (left-branch x)))
                 (total-weight (branch-structure (right-branch x)))))))
(define (balanced? x)
  (if (not (pair? x))
      #t
      (and (= (* (total-weight (branch-structure (left-branch x)))
                 (branch-length (left-branch x)))
              (* (total-weight (branch-structure (right-branch x)))
                 (branch-length (right-branch x))))
           (balanced? (branch-structure (left-branch x)))
           (balanced? (branch-structure (right-branch x))))))
;too slow


(define (make-mobile left right)
  (cons left right))
(define (make-branch length structure)
  (cons length structure))

(define (left-branch x)
  (car x))
(define (right-branch x)
  (cdr x))
(define (branch-length b)
  (car b))
(define (branch-structure b)
  (cdr b))


(define x
  (make-mobile (make-branch 10 (make-mobile (make-branch 12 3)
                                            (make-branch 2 17)))
               (make-branch 12 12)))
