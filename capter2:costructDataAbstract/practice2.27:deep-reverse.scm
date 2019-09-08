(define (deep-reverse x)
  (cond ((null? x) '())
        ((not (pair? x)) x)
        (else (map deep-reverse (reverse x)))))
