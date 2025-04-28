; Exercise 2.20 SCIP






(define (same-parity p . l)
  (define parity (even? p))
  (define (check-parity i)(equal? parity (even? i)))
  (append (list p) (filter check-parity l))
)


(define test-same-parity
  (lambda()
    (and
      (equal? '(1 3 5 7) (same-parity 1 2 3 4 5 6 7))
      (equal? '(2 4 6) (same-parity 2 3 4 5 6 7))
    )
  )
)
