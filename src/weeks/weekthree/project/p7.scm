(load "project/p1")
(load "project/p5")
(load "project/p6")


(define truestrat (lambda(x y) #t))
(define falsestrat (lambda(x y) #f))

(define (test-suit-strategy)
  (and
    (equal? #t ((suit-strategy 'h truestrat falsestrat) '(ah) '3s))
    (equal? #t ((suit-strategy 's truestrat falsestrat) '(5s) '3s))

    (equal? #f ((suit-strategy 's truestrat falsestrat) '(ah) '3s))
    (equal? #f ((suit-strategy 'h truestrat falsestrat) '(5c) '3s))
    (equal? #f ((suit-strategy 'c truestrat falsestrat) '(4d) '3s))
    (equal? #f ((suit-strategy 's truestrat falsestrat) '(5c) '3s))
  )
)

(define (suit-strategy suit strategyone strategytwo)
  (lambda(hand dealercard)
    (if (suitmember hand suit)
      (strategyone hand dealercard)
      (strategytwo hand dealercard)
    )
  )
)

(define (test-valentinev2)
  (and
    (equal? #t (valentinev2 '(ah 5d 2s) 'ad))
    (equal? #t (valentinev2 '(ah ad 5s) 'ad))
    (equal? #t (valentinev2 '(ad 5d) 'ad))
    (equal? #t (valentinev2 '(5d 5d 4s) 'ad))


    
    (equal? #f (valentinev2 '(ad 5d 2s) 'ad))
    (equal? #f (valentinev2 '(ad ad 5s) 'ad))
    (equal? #f (valentinev2 '(ad 5d 2c) 'ad))
    (equal? #f (valentinev2 '(5d 5d 9s) 'ad))
  )
)

(define (valentinev2 hand card)
  ((suit-strategy 'h (stop-at 19) (stop-at 17)) hand card)
)
