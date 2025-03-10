; Exercise 1.16

(define (fast-exp b e)
  (fast-exp-iter b e 1)
)

(define (fast-exp-iter base exponent a)
  (if (equal? exponent 0)
    a
    (fast-exp-iter base (- exponent 1) (* a base)) ; tail call
  )
)
