; Exercise 1.16

(define square (lambda(x) (* x x)))

(define (fast-exp b e)
  (fast-exp-iter b e 1)
)

(define (fast-exp-iter base exponent a)
  (if (equal? exponent 0)
    a
    (if (even? exponent)
      (fast-exp-iter (square base) (/ exponent 2) a) ; tail call
      (fast-exp-iter base (- exponent 1) (* base a)) ; tail call
  )
)
