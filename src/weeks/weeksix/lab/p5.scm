; 2.62

(define (union-set s1 s2)
  (cond
    ((and (null? s1) (null? s2)) '())
    ((null? s1) s2 )
    ((null? s2) s1)
    (else
        (let
            ((s1e (car s1))
             (s2e (car s2)))
            (cond
              ((eq? s1e s2e) (cons s1e (union-set (cdr s1) (cdr s2))))
              ((< s1e s2e) (cons s1e (union-set (cdr s1)  s2)))
              ((> s1e s2e) (cons s2e (union-set s1  (cdr s2))))
              (else (display '(error state reached)))


            )

        ))
  )
)
