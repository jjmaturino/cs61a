; Exercise 2.12 SCIP


(define (make-center-percentage c p)
  (make-interval
    (- c (* (percentage p) c))
    (+ c (* (percentage p) c))
    )
)

(define (test-make-center-percentage)
  (and
    (equal? (make-interval 95 105) (make-center-percentage 100 5))
    (equal? (make-interval 47.5 52.5) (make-center-percentage 50 5))
  )
)

(define percentage
  (lambda(x)
    (/ x 100.0)
  )
)

(define test-percentage
  (lambda()
    (and
      (equal? .01 (percentage 1))
      (equal? .05 (percentage 5))
      (equal? .5 (percentage 50))
      (equal? 1 (percentage 100))
      (equal? 1.5 (percentage 150))
    )
  )
)
