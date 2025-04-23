; Exercise 2.3
(load "lab/p7")

; each adjecent pair makes up the adjecent line segment of a square.
; have pairs where the car is a pair of adjecent lengths
(define (make-rectangle s1 s2)
  (list s1 s2 )
)

; selectors for rectangle
(define rectangle-length
  (lambda(r)
    (segment-length (car r))
  )
)

(define rectangle-height
  (lambda(r)
     (segment-length (car (cdr r)))
  )
)

;
(define (get-perimeter r1)
  (* 2 (+ (rectangle-length r1) (rectangle-height r1)))
)

(define (get-area r1)
  (* (rectangle-length r1) (rectangle-height r1))
)
