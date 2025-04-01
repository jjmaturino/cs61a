(load "project/p1")
(load "project/p5")

(define (test-suitmember)
  (and
    (equal? #t (suitmember '(ah 5d 4s) 'h))
    (equal? #t (suitmember '(ah 5d 4s) 's))

    (equal? #f (suitmember '(ah 5d 4s) 'c))
    (equal? #f (suitmember '(ac 5d 4s) 'h))
  )
)

; suitmember returns true if suit exists in hand
(define (suitmember hand suit)
  (cond
    ((empty? hand) #f)
    ((equal? (getSuit (first hand)) suit) #t)
    (else (suitmember (bf hand) suit))
  )
)

(define (test-valentine)
  (and
    (equal? #t (valentine '(ah 5d 2s) 'ad))
    (equal? #t (valentine '(ah ad 5s) 'ad))
    (equal? #t (valentine '(ad 5d) 'ad))
    (equal? #t (valentine '(5d 5d 4s) 'ad))


    
    (equal? #f (valentine '(ad 5d 2s) 'ad))
    (equal? #f (valentine '(ad ad 5s) 'ad))
    (equal? #f (valentine '(ad 5d 2c) 'ad))
    (equal? #f (valentine '(5d 5d 9s) 'ad))
  )
)

(define (valentine hand card)
  (if (suitmember hand 'h)
    ((stop-at 19) hand card)
    ((stop-at 17) hand card)
  )
)
