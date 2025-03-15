(define (number-of-partitions n)
  (iter-helper n n 0)
)

; The problem isnt recusion, it's that we have to maintain state during each call.
; We fix that by making the recursive call a tail-call

; we have an accumulator parameter that keeps track of necessary information across every iteration
; Each call has enough information to calculate result. Isn't waiting for other calc before processing
(define (iter-helper i currentsum accumulator)
  (cond ((equal? currentsum 0) (+ 1 accumulator))
	((or (< currentsum 0) (equal? i 0)) accumulator)
	(else
	  (let ((new-accumulator (iter-helper (- i 1) currentsum accumulator)))
	    (iter-helper i (- currentsum i) new-accumulator)
	    )
	)
  )
)
