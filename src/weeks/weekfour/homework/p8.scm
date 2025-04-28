; Exercise 2.23 SCIP



(define (for-each fn l)

  (define (helper-iter cl)
    (if (equal? (cdr cl) nil)
      (fn (car cl))
      (let
        (
        (non-res (fn (car cl)))
        )
       (helper-iter (cdr cl))
      )
    )
  )

  (helper-iter l)
)

