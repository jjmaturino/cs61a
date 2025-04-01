(load "project/p1")



(define (test-stop-at-n)
  (and
    (equal? ((stop-at 17) '(ad 8s 5h) 'ad) #t)
    (equal? ((stop-at 17) '(ad 5h) 'ad) #t)
    (equal? ((stop-at 17) '(kd 3h 3s) 'ad) #t)
    (equal? ((stop-at 17) '(ad 4h 3s) 'ad) #f)
    (equal? ((stop-at 17) '(kd 4h 3s) 'ad) #f)

    (equal? ((stop-at 10) '(4h 3s) 'ad) #t)
    (equal? ((stop-at 10) '(4h 5s) 'ad) #t)
    (equal? ((stop-at 10) '(kd 4h 3s) 'ad) #f)
    (equal? ((stop-at 10) '(ad 4h 3s) 'ad) #f)

    (equal? ((stop-at 20) '(ad ah 7s) 'ad) #t)
    (equal? ((stop-at 20) '(ad ah 8s) 'ad) #f)
    (equal? ((stop-at 20) '(ad ah 9s) 'ad) #f)
  )
)



(define (stop-at n)
  (lambda(playerhand dealercard)
    (if (< (best-total playerhand) n)
      #t
      #f
    )
  )
)
