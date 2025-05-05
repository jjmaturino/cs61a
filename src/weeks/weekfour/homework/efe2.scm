; SCIP 2.6


; one
(define one (lambda(f)(lambda(x)(f x))))

; two
(define two (lambda (f)(lambda(x)(f (f x)))))
