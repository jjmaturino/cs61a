; Exercise 2.18 SICP


(define test-reverse
  (lambda()
    (and
      (equal? (list 25 16 9 4 1) (reverse (list 1 4 9 16 25)))
      (equal? (list 1 4 9 16 25) (reverse (list 25 16 9 4 1)))
    )
  )
)
