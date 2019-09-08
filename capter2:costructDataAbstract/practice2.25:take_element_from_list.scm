(define a (list 1 3 (list 5 7) 9))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(cdr (car (cdr (cdr a))))

;7
(car (car b))
;7
(define (mycadr x) (car (cdr c)))
(mycadr (mycadr (mycadr (mycadr (mycadr (mycadr c))))))
;7
