(define (make-account balance password)
  ;不变的部分
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown Request -- MAKE-ACOUNT" m))))
  ;增加的部分
  (define password-check-monitor
    (make-monitor (lambda (x) (eq? x password))))

  (define (password-protect p m)
    (if (password-check-monitor p)
        (dispatch m)
        "incorrect password"))

  ;返回值
  password-protect)
