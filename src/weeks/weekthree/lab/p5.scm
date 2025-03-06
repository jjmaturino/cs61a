(load "lab/p4")

(define (make-safe fn argPredicate)
  (
   lambda(argInstance)
    (type-check fn argPredicate argInstance)
  )
)
