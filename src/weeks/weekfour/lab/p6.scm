; Exercise 2.1 from SICP

(define (make-rat n d)
  (cond
    ((equal? d 0)(error "cannot have a denominator of value 0"))
    ((or (< n 0) (< d 0)) (cons ( * (abs n) -1) (abs d)))
    (else (cons n d))
  )
)

