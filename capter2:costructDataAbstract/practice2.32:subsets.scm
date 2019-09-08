(define (subsets set)
  (if (null? set)
      '(())	;;必须是‘(())。 否则，在第一次执行map时会因为列表中无对象，使第一个subset为空表，从而导致之后每一个都为空
      (let ((rest (subsets (cdr set))))
        (let ((subset (map (lambda (x) (cons (car set) x))
                           rest))) ;;这里应使用cons而非append,因为不能保证每一个元素 (x)都为列表，x有可能是 1 2 这样的元素，无法进行append
           (append rest subset)))))


(subsets '(1 2 3 4))

;;(() (4) (3) (3 4) (2) (2 4) (2 3) (2 3 4) (1) (1 4) (1 3) (1 3 4) (1 2) (1 2 4) (1 2 3) (1 2 3 4))


;;map要求列表中有对象，空表会返回空表，如果proc是类append操作要注意
;;append要求第一个参数为列表类型，如果第一个参数为'()，(append '() 1)会产生 1 而不是 (1)。
