(define (number-of-partitions n)
  (helper n n 0)
)

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
