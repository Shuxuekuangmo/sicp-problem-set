(define (compare key1 key2))

(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) #f)
        ((= (compare given-key
                     (key (entry set-of-records)))
            0)
         (entry set-of-records))
        ((< (compare given-key
                     (key (entry set-of-records)))
            0)
         (lookup given-key (left-branch set-of-records)))
        ((> (compare given-key
                     (key (entry set-of-records)))
            0)
         (lookup given-key (right-branch set-of-records)))))
