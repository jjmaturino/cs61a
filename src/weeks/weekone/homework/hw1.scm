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

; each iteration,
; we grab the first value in the ds
; 1
; Then we recursively get the next value. Thus
; 1 <
; - 2
; - - 3
; - - - Nil

; base case is st is nil
; in each other case we 
; A. Grab the first element
; B. We compare it with the previous elements

; Exercise #4
(define (ordered? numbers)
	(if (equal? numbers nil)
	    #t
	    (orderedhelper (first numbers) (bf numbers))
	)
)

(define (orderedhelper cv numbers)
  (if (equal? numbers nil)
      #t
      (if (<= cv (first numbers))
	(orderedhelper (first numbers) (bf numbers))
	#f
      )
  )
)

; Exercise #5
(define (ends-e words)
  (cond ((equal? words nil) '())
	(
	 (if (equal? (last (first words)) 'e)
	    (se (first words) (ends-e (bf words)))
	    (se (ends-e (bf words)))
	  )
	)
  )
)


; Exercise #6
; Benefits of treating or/and procedures as special forms decreases the potential number
; of arguments that have to be 

; takes a proceedure and check to see if it's a special form or not
; special forms
; if and is special only the first expression will be executed
; else all the expressions listed under and will be executed
(define (test-special-form)
  ; var in local env
  (define test-val 0)

  (define (will-increment)
    (set! test-val (+ test-val 1))
      #t
   )

  ; Test AND
  (display "Testing if AND is a special form: \n")
  (set! test-val 0)
  (and #f (will-increment))
  (if (equal? test-val 1)
      (display "AND is not a special form - evaluated all arguements")
      (display "AND is a special form - only evaluted first argument")
  )

  (display "\n") ; formatting
  (display "\n") ; formatting

  ; Test OR
  (display "Testing if OR is a special form: \n")
  (set! test-val 0)
  (or #t (will-increment))
  (if (equal? test-val 1)
      (display "OR is not a special form - evaluated all arguements")
      (display "OR is a special form - only evaluated first arguement")
  )


  (display "\n") ; formatting
)

