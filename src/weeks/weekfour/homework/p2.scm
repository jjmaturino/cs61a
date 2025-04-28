; exercise 2.8

; we want to calculate the 
; a. smallest number for the interval (aka, smallest value, subtracted by the largest number)
; -> (lower-bound of whats being subtracted) (upper-bound of what's subtracting) 
; b. largest number possible for the interval (aka, largest value, subtracted by the smallest number)
; -> (upper-bound of whats being subtracted) (lower-bound of what's subtracting)

(define (sub-interval i1 i2)
  (make-interval
    (- (lower-bounds i1)
       (upper-bound i2))
    (- (upper-bounds i1)
       (lower-bounds i2))
   )
)
