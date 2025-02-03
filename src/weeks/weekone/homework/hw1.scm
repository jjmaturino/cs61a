
; Exercise #2

(define (square x)( * x x))

(define (squares nums)
  		(if (empty? nums)
		  ; base case when nums is empty
		  nums
		  ; recusrive call - adds first number squared,
		  ; then calls squared minus the number just squared
		  (se (square (first nums)) (squares (bf nums)))
		 )
)

; Exercise #3

; defines desired procedure definition (function API)
(define (switch st)
  (switch-helper st 0)
)

; used to add necessary information needed to acheive desired result with function api wrapper
(define (switch-helper st level)
  ; base case. If no more words need to be processed return
  (if (empty? st)
    '()
    ; updates the first word in the sequence, recursively called on the remaining sequence.
    (se (swap-words (first st) (= level 0)) (switch-helper (bf st) (+ level 1)))
  )
)

; used to determine if word instance should be modified or not.
(define (swap-words target initialword)
  ; if the current word is either I, i, me, or Me, it gets replaced by you
  ; if the current word is you, it gets replaced by me, except in the case where the word in question (target)
  ; is the first word in the sentence, then it gets replaced by I
  ; otherwise, the target word is returned.
  (cond ((member? target '(i me)) 'you)
  	((member? target '(you)) 
  	 (if initialword
	   'i
	   'me
	 )
	)
	(else target)
  )
)

