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

(define GCD (lambda(x y)(
			 if (equal? y 0)
			    x
			    (GCD y (remainder x y))
			  ))
 )

(define isRelativePrime? (lambda(x y)(equal? (GCD x y) 1)))

; relative prime product (rpp)
(define (rpp num)(filtered-accumulate * 1 1 num identity increment (lambda(x)(isRelativePrime? num x))))


; 1.40
(define dx 0.00001)
(define tolerance 0.00001)
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	next
	(try next)
      )
    )
   )
  (try first-guess)
)


(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess)
)

(define cube (lambda(x)(* x x x)))

(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x)
	    ((deriv g) x)
	 )
    )
   )
)

(define (newtons-method g guess)
  (fixed-point-of-transform g newton-transform guess)
)

(define (cubic a b c)
  (lambda(x)
    (
     + (cube x)
     (* (sq x) a)
     (* x b)
     c
     )    
  )
)

; 1.41
(define (double fn)(lambda(x)(fn(fn x))))
; (
;   (
;     (double (double double))
;      inc
;   (
;   5
; )
; = 21

; 1.43
(define (compose f g)(lambda(x)(f(g x))))
(define (repeatedhelper fn n a)
   (
    if (equal? n a)
       fn
       (compose fn (repeatedhelper fn n (increment a)))
   )
)

(define (repeated fn n)
  if (equal? n 0)
      '()
      (repeatedhelper fn n 1)
)

; 1.46
(define (iterative-improve validfn nextfn)
  (define (helper guess)
    (
     if (validfn guess)
      (nextfn guess) 
      (helper (nextfn guess))
     )
   )

  helper
)


; --- sqrt rewrite
(define (average x y)(/ (+ x y) 2))
(define (good-enough? guess x)
  (
   < (abs (- (sq guess) x)) tolerance
   )
)

(define (improve guess x)
 (
   average guess (/ x guess)
 )
)

(define (sqrt-iter x)
  ((iterative-improve (lambda(guess)(good-enough? guess x)) (lambda(guess)(improve guess x))) 1.0)
)


; -- fixed-point rewrite
(define (v2fixed-point f guess)
  ((iterative-improve (lambda(x)(close-enough? x (f x))) (lambda(x)(f x))) guess)
)


; Exercise #2
(define (every fn l)
  (if (empty? l)
      '()
      (se (fn (first l)) (every fn (bf l)))
  )
)


; Exercise #3
