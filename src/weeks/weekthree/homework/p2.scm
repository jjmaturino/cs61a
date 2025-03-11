; Exercise 1.35
; φ^2=φ+1. is an equation that is satisfied by the golden ratio
; 
; Observe that φ2=φ+1 can be rewriten to φ= φ + (1 / φ).
; When this occurs, we can find the fixed point of the function in order to find a value
; that satisfies the equation.
;
; By applying a fixed point procedure we verify that the golden ratio indeed, does satisfy the the equation
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (golden-ratio)
  (fixed-point (lambda(x)(+ 1 (/ 1 x))) 1)
)

