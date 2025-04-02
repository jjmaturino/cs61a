(load "project/p5")

(define test-reckless
  (lambda()
    (and
      (equal? #t ((reckless (stop-at 17)) '(ah 6d) '3c))

      (equal? #f ((reckless (stop-at 17)) '(ah 6d 4h) '3c))
    )
  )
)

(define (reckless s1)
  (lambda(hand card)
    (if (s1 (bl hand) card)
      #t
      #f
    )
  )
)
