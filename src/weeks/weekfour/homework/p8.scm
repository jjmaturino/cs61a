; Exercise 2.23 SCIP



(define (for-each fn l)

  (define (helper-iter cl)
    (if (empty? cl) 
      #t
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

