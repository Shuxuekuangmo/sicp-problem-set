(define (make-leaf symbol weight)
  (list 'leaf symbol weight))
(define (leaf? obj)
  (and (pair? obj) (eq? (car obj) 'leaf)))

(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

                                        ;通用型的weight symbal 可以处理leaf 和tree类型

(define (left-branch t) (car t))
(define (right-branch t) (cadr t))



(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

                                        ;解码过程

(define (decode bits tree)
  (define (choose-branch bit tree)
    (cond ((= bit 0) (left-branch tree))
          ((= bit 1) (right-branch tree))
          (else (error "bad bit -- CHOOSE-BRANCH" bit))))

  (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) tree)))
        (if (leaf?  next-branch)
            (cons (symbol-leaf next-branch)
                  (decode (cdr bits) tree))
            (decode (cdr bits) next-branch)))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        ;((= (weight x) (weight (car set))) set)
        ((>= (weight x) (weight (car set))) (cons (car set)
                                                (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair) ;symbol
                               (cadr pair)) ;weight
                    (make-leaf-set (cdr pairs))))))
