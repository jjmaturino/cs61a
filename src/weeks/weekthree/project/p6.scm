(load "project/p1")

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
