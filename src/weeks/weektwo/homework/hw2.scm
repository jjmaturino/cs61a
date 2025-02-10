; Homework Week 2
; Author: Juan Maturino
;
; Exercise #1. Problems (1.31(a), 1.32(a) 1.33 1.40 1.41 1.43 1.46.

; Helper Functions
(define (identity x) (* x 1))
(define increment (lambda(x)(+ x 1))) 
(define square (lambda(x)(* x x)))
(define sq square)
(define isDivisible? (lambda(n d)(equal? (remainder n d) 0)))
(define (isNotDivisible? n d)(not (isDivisible? n d)))
(define (myand x y)(and x y))
(define isPrime? (lambda(num)(
			      cond ((> num 2)
			         (
				 filtered-accumulate
						myand 
						#t 
						2 
						num
						(lambda(n)(isNotDivisible? num n )) 
						(lambda(n)(if (> (sq n) num)(sq n) (increment n)))
						(lambda(x)(equal? x x)) 
		                ))
			      ((equal? num 2) #t)
			      (else #f)
		)
        )
)



; 1.31(a)

(define (product fn a b nextFn)(
		if (> a b) 
		   1
		   (* (fn a) (product fn (nextFn a) b nextFn))
	)
  )

(define factorial (lambda (num)(
		product identity 1 num increment
		)
        )
)

(define (wallisproduct iterations)(product (lambda(n)( / (* 4 (sq n)) (- (* 4 (sq n)) 1 ))) 1 iterations increment))

; 1.32(a)
(define (accumulate combiner combiner-identity a b fn stepFn)(
		if (> a b)
		    combiner-identity
		    (combiner (fn a) (accumulate combiner combiner-identity (stepFn a) b fn stepFn))
		

							      ))

(define wpaccumulate (lambda(x)(accumulate * 1 1 x (lambda(n)( / (* 4 (sq n)) (- (* 4 (sq n)) 1 ))) increment)))

; 1.33
(define filtered-accumulate (lambda(combiner combiner-identity a b fn stepFn filterFn)(
				cond ((> a b) combiner-identity)
				     ((filterFn a) (combiner (fn a) (filtered-accumulate combiner combiner-identity (stepFn a) b fn stepFn filterFn) )) 
				     (else (combiner combiner-identity (filtered-accumulate combiner combiner-identity (stepFn a) b fn stepFn filterFn) ))
				   )
			      )
  )

		
(define (primesum num)(filtered-accumulate + 0 1 num sq increment isPrime?))

