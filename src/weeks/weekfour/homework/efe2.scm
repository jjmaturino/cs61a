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

(define (predecessor n)
  (define (pair a b)(lambda(f)(f a b)))
  (define (first p)(p (lambda(a b) a)))
  (define (second p)(p (lambda(a b) b)))
  (define (shift p)(pair (second p) (add-1 (second p))))

  (first ((n shift) (pair zero zero)))
)

; - subtraction
(define (- n m) ((m predecessor) n))

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
