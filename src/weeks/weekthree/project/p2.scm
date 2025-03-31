(load "project/p1")


(define (test-stop-at-17)
  (and
    (equal? (stop-at-17 '(ad 8s 5h) 'ad) #t)
    (equal? (stop-at-17 '(ad 5h) 'ad) #t)
    (equal? (stop-at-17 '(kd 3h 3s) 'ad) #t)
    (equal? (stop-at-17 '(ad 4h 3s) 'ad) #f)
    (equal? (stop-at-17 '(kd 4h 3s) 'ad) #f)
  )
)

(define stop-at-17 (lambda (playerhand dealercard)
    (let( 
          (total (best-total playerhand)))
      (
       if (< total 17) 
        #t
        #f
      )
  )
 )
)
