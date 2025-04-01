(load "project/p1")



(define (test-dealer-sensitive)
  (and
    (equal? #t (dealer-sensitive '(8h 8d) 'Ad))
    (equal? #t (dealer-sensitive '(8h 8d) 'Kd))
    (equal? #f (dealer-sensitive '(8h 8d Ah) 'Kd))

    (equal? #t (dealer-sensitive '(3h 4d) '2d))
    (equal? #t (dealer-sensitive '(8h 3d) '6s))
    (equal? #f (dealer-sensitive '(8h 3d as) '6s))
  )
)


(define (dealer-sensitive playerhand dealercard)
  (if (member? (getRank dealercard) '(a 7 8 9 10 k q j)) 
    (< (best-total playerhand) 17)
    (< (best-total playerhand) 12)
   )
)
