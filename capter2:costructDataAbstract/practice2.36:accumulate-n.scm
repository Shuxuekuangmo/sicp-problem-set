(define (accumaulate-n op init seqs)
  (if (null? seqs)
      '()
      (cons (accumulate op init ))))
