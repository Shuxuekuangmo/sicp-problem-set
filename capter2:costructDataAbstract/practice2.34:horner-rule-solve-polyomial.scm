(define (horner-solve x coefficient-sequence)
  (accumulate (lambda (a b) (+ a (* b x)))
              0
              coefficient-sequence))
