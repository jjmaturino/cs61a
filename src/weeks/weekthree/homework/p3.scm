; Exercise 1.38

; k-term finite continued fraction procedure
(define (cont-fract n d k)
  (iter-cont-fract n d k 0)
)

(define recursive-cont-fract
  (lambda(n d k i)
    (if (equal? i k)
      0
      (/ (n i) (+ (d i)(recursive-cont-fract n d k (+ i 1)) ))
    )
  )
 )

(define iter-cont-fract
  (lambda(n d k res)
    (if (equal? k 0)
      res
      (iter-cont-fract n d (- k 1) (/ (n k) (+ (d k) res)))
     )
  )
)

; It takes k=11  in order to achieve an accuracy of 4 decimal points for 1 / φ ; Recursive Procedure
; It takes k=11  in order to achieve an accuracy of 4 decimal points for 1 / φ ; Iterative Procedure

  
