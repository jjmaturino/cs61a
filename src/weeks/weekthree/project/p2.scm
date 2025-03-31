(load "project/p1")


(define (test-stop-at-17)
  (and
    (equal? (stop-at-17 '(ad 8s 5h)) #t)
    (equal? (stop-at-17 '(ad 5h)) #t)
    (equal? (stop-at-17 '(kd 3h 3s)) #t)
    (equal? (stop-at-17 '(ad 4h 3s)) #f)
    (equal? (stop-at-17 '(kd 4h 3s)) #f)
  )
)

(define stop-at-17 (lambda (hand)
    (let( 
          (total (best-total hand)))
      (
       if (< total 17) 
        #t
        #f
      )
  )
 )
)
