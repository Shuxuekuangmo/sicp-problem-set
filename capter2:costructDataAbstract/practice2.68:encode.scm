(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message))
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  )
