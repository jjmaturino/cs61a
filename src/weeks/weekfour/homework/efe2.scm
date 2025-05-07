; SCIP 2.6

; zero
(define zero (lambda(f)(lambda(x) x)))

; one
(define one (lambda(f)(lambda(x)(f x))))

; two
(define two (lambda (f)(lambda(x)(f (f x)))))

; add-1
(define add-1
  (lambda (n)
    (lambda (f)
      (lambda(x)
        (f ((n f) x))
      )
    )
  )
)

; + addition
(define (+ n m)
  (lambda (f)
    (lambda(x)
      ((n f) ((m f) x))
    )
  )
)

; - subtraction
(define -
  (lambda (n m)
    (- n m)
  )
)

; * multiplication
(define (* n m)
  (lambda(f)
    (lambda(x)
      ((n (m f)) x)
    )
  )
)



; ^ exponentiation 
(define (^ n m)
  (define id (lambda(x) x))
  ((m n) id)
)

; converts church integers to numeric representations
(define (church-to-int n)
  ((n (lambda(x)(+ x 1))) 0)
)
