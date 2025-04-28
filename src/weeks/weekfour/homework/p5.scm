; Exercise 2.17 SCIP


(define (custom-last-pair l)
  (if (equal? nil (cdr l))
    (car l)
    (last-pair (cdr l))
  )
)




(define test-last-pair
  (lambda()
    (and
      (equal? '(34) (custom-last-pair (list 23 72 149 34)))
      (equal? '(17) (custom-last-pair (list 23 72 149 17)))
      (equal? '(27) (custom-last-pair (list 23 14923 23 149 149 27)))
    )
  )
)
