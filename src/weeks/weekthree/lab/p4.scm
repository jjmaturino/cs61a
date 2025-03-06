; Q4

(define (type-check fn typePredicate arg)
  (if (not (typePredicate arg))
    #f
    (fn arg)
  )
)
