; Exercise 1

; helper-predicate function
(define isEven? (lambda(n)(equal? (remainder n 2) 0)))
(define (square x)(* x x))
(define sq square)
(define tolerance 0.00001)
(define (close-enough? x y)(< (abs (- x y)) tolerance))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Helper Functions created in previous assignements

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


(define (fixed-point f guess)
  ((iterative-improve 
     (lambda(x)(close-enough? x (f x)))  ; validFn
     (lambda(x)(f x)))			 ; nextFn
   guess)		 
)


; 1.16 -iterative process implementation of fast-expt using recursion with a log(n) tc
; b(n) = b^(2 n/2) -> even n
; b(n) = b
; thought each iteration square the previous product of b^2, until the number of iterations * 2 >= n

; helper defined outside for ease in tracing during exercies. In pratice, my preference is to place inside
; of associated function to limit the scope of the helper to the env of the wrapper function

(define (expt-helper b n a)
	(cond ((= n 0) a)
	      ((isEven? n) (expt-helper b (/ n 2) (* a (sq b))))
	      (else (expt-helper b (- n 1) (* a b)))
	)
)

(define (fast-expt b n)
 (expt-helper b n 1)
)

; 1.35
(define (find-golden guess)
  (fixed-point (lambda(x)
		 (+ 1 ( / 1 x)))
		 guess)
)


; 1.37 
; solved with via a recursive process -: took k = 11 to achieve a accuracy of 4 decimal points
(define (cont-frac n d k)
  (define zeroIndexedK (- k 1))
  (define initialStart 0)
  (define helper (lambda(n d i)
		   (
		    if (> i zeroIndexedK)
		    (/ (n i) (d i)) ; n(k) / d(k)
		    (/ (n i) (+ (d i) (helper n d (+ i 1)))) ; n(i) / d(i) + .... n(k)/d(k)
		   )
		 )
   )


  (helper n d initialStart)
)

; solved with via an iterative process
(define (cont-frac-iter n d k)
   (define start 0)
   (define zeroIndexedK (- k 1))
   (define initialSum 0)
   (define helper (lambda (result i)
     (
      if (< i 0)
	 result
	 (helper (/ (n i) (+ (d i) result)) (- i 1))
     )
    )
   )

   (helper initialSum zeroIndexedK)
)



; 1.38

(define (euler-e k)
  (define (n i) 1.0)
  (define (d i)
    (
     if (equal? 0  (remainder (+ i 2) 3) )
        (* 2.0 (/ (+ i 2) 3))
	1.0
    )
  )
  
  (+ 2 (cont-frac-iter n d k))
)
