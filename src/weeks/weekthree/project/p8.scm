(load "project/p4")
(load "project/p5")
(load "project/p7")

(define BOUNDARY 1)

(define test-majority
  (lambda()
    (and
      (equal? #t ((majority (stop-at 17) dealer-sensitive valentinev2) '(ah 3s 2c) 'kd))
      (equal? #t ((majority (stop-at 17) dealer-sensitive valentinev2) '(ah 3s 2c) '6c))
      (equal? #t ((majority (stop-at 17) dealer-sensitive valentinev2) '(as 3s 2c) '3d))


      (equal? #f ((majority (stop-at 17) dealer-sensitive valentinev2) '(ah 3s 3c) 'kd))
      (equal? #f ((majority (stop-at 17) dealer-sensitive valentinev2) '(as 3s 3c) '3d))
      (equal? #f ((majority (stop-at 17) dealer-sensitive valentinev2) '(ah 3s 4c) 'kd))

    )
  )
)

(define (majority s1 s2 s3)
  (lambda(hand card)
    (let
      ((r1 (majorityhelper s1 hand card))
       (r2 (majorityhelper s2 hand card))
       (r3 (majorityhelper s3 hand card))
       )
      (if ( > (+ r1 r2 r3) BOUNDARY)
        #t
        #f
      )
    )
  )
)



(define test-majorityhelper 
  (lambda()
    (and
      (equal? 1 (majorityhelper (stop-at 17) '(ah 3s) '5c))
      (equal? 1 (majorityhelper dealer-sensitive '(ah 3s 2c) 'kd))
      (equal? 1 (majorityhelper valentinev2 '(ah 3s 3c) 'kd))

      
      (equal? 0 (majorityhelper (stop-at 17) '(ah 9s) '5c))
      (equal? 0 (majorityhelper dealer-sensitive '(ah 3s 3c) 'kd))
      (equal? 0 (majorityhelper valentinev2 '(ah 4s 5c) 'kd))
    )
  )
)
; majorityhelper returns integer representation of strategy outcome
(define (majorityhelper strategy hand card)
  (if (strategy hand card)
    1
    0
  )
)
