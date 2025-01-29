
(define (square x) (* x x))

(define (largestTwoSum x y z)
  (if (> x  y)
      (if (> y z)
          (+ (square x) (square y))
          (+ (square x) (square z))
      )
      (if (> x z)
          (+ (square y) (square x))
          (+ (square y) (square z))
      )
  )
)

;; (3 C 2) = 6 permutations, (3 R 2) = 3 combinations
(define (proc x y z)
  (cond ((and (>= x z) and (>= y z)) (+ (square x) (square y)))
        ((and (>= x y) and (>= z y)) (+ (square x) (square z)))
        (else (+ (square y) (square z)))
   )
)

(define (dupls-removed initialList)
  (dupls-helper initialList ())
)

(define (dupls-helper l s)
        (if (equal? (count l) 0)
            s 
            (if (member? (first l) s)
                (dupls-helper (butfirst l) s)
                (dupls-helper (butfirst l) (sentence s (first l)))
            )
        )
)
