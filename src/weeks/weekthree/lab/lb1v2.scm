; Reimplementing Week Three... other events occured in life and pushed back schedule of course completion by a week
; so I'm using week 3, the previous weeks course material as a starting point

; q: Identify two ways to change the coin coins program in order to reverse the order
; in which coins are used (ascending order)

; First option: increment the count of the coins being used. Change the cc function
; to increment the types of coins. Make one of the base cases when the amount of coins is greater than the 
; total amount of coins available

(define (count-change amount)
  (cc amount 1)
)

(define (cc amount kinds-of-coins)
  (cond ((equal? amount 0) 1)
        ((or (< amount 0) 
            (equal? kinds-of-coins 6))
         0)
        (else
          (+ (cc amount (+ kinds-of-coins 1)) (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins))
        )
  )
)

(define first-denomination 
  (lambda (x)
  (cond ((equal? x 1) 1)
        ((equal? x 2) 5)
        ((equal? x 3) 10)
        ((equal? x 4) 25)
        ((equal? x 5) 50)
        (else -1)
  )
)
)

; Second Option, map the keys in reverse order, the largest key, maps to the smallest value.





