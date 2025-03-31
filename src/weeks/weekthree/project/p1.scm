;(load "project/twenty-one")


; todo. Change so that test-best-total takes in tests cases where the
; arguements are what the output should be and the input is the pararameters to best-total
; write in an iterative process and recursive process
(define test-best-total (lambda()
   (and 
     (equal? 21 (best-total '(ad as 9h)))
     (equal? 19 (best-total '(ad 8s)))
     (equal? 14 (best-total '(ad 8s 5h)))
     (equal? 21 (best-total '(ad as 9h)))
   )
  )
)

(define startingSum 0)
(define blackjackCeiling 21)
(define pictureCards '(J Q K)) ; potentially sanitize

(define (best-total hand)
  (helper hand startingSum)
)


; helper function used to calcuate the best total sum of a hand in black jack
; Challenge; write this in an iterative process; Hint... You can always add more later on
(define (helper currentHand currentSum)( 
  if (or (empty? currentHand) (> currentSum blackjackCeiling)) ; base case
       currentSum
       (
        let(
        (cardValue (getValue (getRank (first currentHand))))
        (remainingHand (bf currentHand)))

        (if (equal? cardValue 'ace)
          (let (
                (aceAsOne (helper remainingHand (+ currentSum 1)))
                (aceAsEleven (helper remainingHand (+ currentSum 11)))
               )
              (cond 
                ; both are less than ceiling, picks largest of two
                ((and (<= aceAsOne blackjackCeiling) (<= aceAsEleven blackJackCeiling)) 
                 if (>= aceAsOne aceAsEleven)
                  aceAsOne
                  aceAsEleven
                )
                ; picks valid branch
                ((<= aceAsOne blackjackCeiling) aceAsOne)
                ((<= aceAsEleven blackjackCeiling) aceAsEleven)
                ; all are invalid
                (else aceAsOne) 
              )
          )

          (helper remainingHand (+ cardValue currentSum))
      )
    )
  )
)

; otherwise we want to recursively interate through the collection of cards
; getRank returns the rank associated with a card
(define getRank (lambda(card)(first card)))

; Need to sus this out.
(define getValue (lambda(rank)
                   (cond 
                     ((equal? rank 'a) 'ace)
                     ((member? rank pictureCards) 10)
                     (else rank)
                   )
                  )
)
