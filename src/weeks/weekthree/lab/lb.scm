; Exercise 1

(define (count-change amount)
  (cc amount 5))


; # number of ways to get to amount without largest coin
; +
; # number of ways to get to (amount - current larget coin) with all coins
;

(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) 
             (= kinds-of-coins 0)) 
         0)
        (else 
         (+ (cc amount (- kinds-of-coins 1))
            (cc (- amount (first-denomination 
                           kinds-of-coins))
                kinds-of-coins)))))


(define (first-denomination kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))


; change the algo to increase until amount == target
; and increase the coin coint.
(define (ccv2 currentamount targetamount kinds-of-coins)
  (cond ((= currentamount targetamount) 1)
        ((or (> currentamount targetamount ) 
             (= kinds-of-coins 6)) 
         0)
        (else 
         (+ (ccv2 currentamount targetamount (+ kinds-of-coins 1))
            (ccv2 (+ currentamount (first-denomination 
                           kinds-of-coins))
		targetamount
                kinds-of-coins)))))

(define (countchangev2 amount)
  (ccv2 0 amount 1)
)
