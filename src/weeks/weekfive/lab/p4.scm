; 2.27


; ( ( 1 2 ) ( 3 4))
(define (deep-reverse l)
  (if (not (pair? l)) 
    l
    (reverse (map deep-reverse l))
  )
)

(define (test-dr)
  (and
    (equal? '( (4 3) (2 1)) (deep-reverse '( (1 2) (3 4)) ) )
    (equal? '( (1 4) (2 5)) (deep-reverse '( (5 2) (4 1)) ) )
  )
)
