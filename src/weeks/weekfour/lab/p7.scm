; Exercise 2.2 SICP

(define (make-segment p1 p2)(cons p1 p2))
(define (start-segment s)(car s))
(define (end-segment s)(cdr s))
; added for exercise 2.3
(define (segment-length s)
  (sqrt
    (+
      (expt ( - (x-point (end-segment s)) (x-point (start-segment s))) 2)
      (expt ( - (y-point (end-segment s)) (y-point (start-segment s))) 2)
    )
  )
)

(define test-segment-length(lambda()
  (and
    (equal? 4 (segment-length (make-segment (make-point 0 0) (make-point 4 0))))
    (equal? 1 (segment-length (make-segment (make-point 0 4) (make-point 0 5))))
    (equal? 4 (segment-length (make-segment (make-point 0 -2) (make-point 0 2))))
  )
 )
)




(define (make-point x y)(cons x y))
(define (x-point p)(car p))
(define (y-point p)(cdr p))

(define (midpoint-segment s)
  (make-point 
    (/ (+ (x-point (start-segment s)) (x-point (end-segment s))) 2)
    (/ (+ (y-point (start-segment s)) (y-point (end-segment s))) 2)
  )
)

(define test-midpoint-segment (lambda()
  (and
    (equal? (make-point 2 0) (midpoint-segment (make-segment (make-point 0 0) (make-point 4 0))))
    (equal? (make-point 0 2) (midpoint-segment (make-segment (make-point 0 0) (make-point 0 4))))
    (equal? (make-point 2 2) (midpoint-segment (make-segment (make-point 0 0) (make-point 4 4))))
  )
 )
)
