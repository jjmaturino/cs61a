; Exercise 1

; helper-predicate function
(define isEven? (lambda(n)(equal? (remainder n 2) 0)))
(define (square x)(* x x))
(define sq square)


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


; 1.37


; 1.38
