; Q3
(define (count-change amount)
  (cc amount '(50 25 10 5 1))
)

; how many ways to make change with amount and x coins
(define (cc amount kinds-of-coins)
  (cond ((equal? amount 0) 1)
        ((or (< amount 0) 
            (empty? kinds-of-coins))
         0)
        (else
          (+ 
            (cc amount (bf kinds-of-coins)) 
            (cc (- amount (first kinds-of-coins)) kinds-of-coins)
          )
        )
  )
)
