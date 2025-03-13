; Exercise 6


#| Book Version of cc procedure

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)

        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))
|#


#| Homework Version with base cases switched

(define (cc amount kinds-of-coins)
  (cond ((or (< amount 0) (= kinds-of-coins 0)) 0)
	((= amount 0) 1)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))

|#

#| 

The interchange wouldn't change the return values based on (valid) input.

If there were side effects in procedure call, there could be instances of different outputs for inputs.

|#

