; Exercise 2
(define substitute (lambda (currentsentence ow nw) (
			cond ((empty? currentsentence) '() )
			     ((equal? (first currentsentence) ow)
				(se nw (substitute (bf currentsentence) ow nw))
			      )
			     (else
				(se (first currentsentence) (substitute (bf currentsentence) ow nw))
			      )
		)
	)
)

; Exercise 3
; Function g takes 0 arguements
; Return type of g is a function definition that has one formal parameter. -> we are not executing the function

; Exercise 4

; f
(define f 4)

; (f)

(define (f) (1))

; (f 3)

(define (f a) (a))

; ((f))
(define (f)(lambda()(1)))

; (((f)) 3)
(define f (lambda () ( lambda(x) (x))))


; Exercise 5
;a.)  ((t 1+) 0) = 3
;b.) ((t (t +1)) 0) = 9
;c.) (((t t) +1) 0 = 27

; Exercise 6
; a.) ((t s) 0) = 3
; b.) ((t (t s) 0) = 9
; c.) (((t t) s) 0) =  27

; Exercise 7
(define (make-tester w)(lambda (cw)(equal? w cw)))


