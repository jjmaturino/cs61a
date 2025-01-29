(define (plural wd)
  (cond ((equal? (last wd) 'y) (
            if (member? (last (bl wd)) '(a e i o u))
              (word wd 's)
              (word (bl wd) 'ies)
            )
         )
        (else (bl wd 's))
  )
)

