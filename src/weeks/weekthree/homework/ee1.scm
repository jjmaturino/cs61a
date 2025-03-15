(define (number-of-partitions n)
  (helper n n 0)
)

; place outside for easier tracing... in practice would be useful to remove n parameter and access it via
; the outer scope of the parent function it was defined in
(define (helper n i currentSum)
    (cond ((equal? n currentSum) 1)
	  ((or (< n currentSum) (equal? i 0)) 0)
	  (else
	    (+ 
	      (helper n (- i 1) currentSum)
	      (helper n i (+ currentSum i))
	    ))
    )
  )
