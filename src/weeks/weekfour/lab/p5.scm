
(define (+rat r1 r2)
  (make-rational
    (+ (* (numerator r1) (denominator r2)) (*(numerator r2) (denominator r1)))
    (* (denominator r1) (denominator r2))
  )
)
