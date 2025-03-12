; Exercise 5 (#2 in pdf)

(define (next-perf n)
  (if (equal? n (sum-of-factors n))
    n
    (next-perf (+ n 1))
  )
)

(define (sum-of-factors x)
	(
	 define (iter-sum-of-factors i)
	 (cond ((>= i x) 0)
	       ((not (equal? (modulo x i) 0))(+ 0 (iter-sum-of-factors (+ i 1))))
	       (else (+ i (iter-sum-of-factors (+ i 1))))
	 )
   )

  (iter-sum-of-factors 1)
)
