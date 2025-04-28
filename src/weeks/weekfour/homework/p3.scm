; Exercise 2.10 
(load "homework/p1")



(define (div-interval x y)
  (let
    ((lb (lower-bound y))
     (ub (upper-bound y)))
    (if (<= lb 0 ub)
      (error  "can't divide by an interval spanning zero: " y)
      (mul-interval x (make-interval (/ 1.0 ub) (/ 1.0 lb)) )
    )
  )
)


(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) 
               (lower-bound y)))
        (p2 (* (lower-bound x) 
               (upper-bound y)))
        (p3 (* (upper-bound x) 
               (lower-bound y)))
        (p4 (* (upper-bound x) 
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (make-interval a b)(cons a b))

