(load "homework/p7") ; -> accumulate n from 2.36
; 2.37 -> This is one of my favorite exercises so far

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda(row)(dot-product v row)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda(row)(matrix-*-vector cols row)) m)))




;; test code
(define (test-matrix-*-vector)
  (and
    (equal? (matrix-*-vector (list '(1 2) '(3 4)) (list 5 6)) (list 17 39))
  )
)

(define (test-transpose)
  (and
    (equal? (transpose (list '(1 2 3) '(4 5 6) )) (list  '(1 4) '(2 5) '(3 6)))
  )
)

(define (test-matrix-*-matrix)
  (and
    (equal? (matrix-*-matrix  
              (list '(1 2 3) '(4 5 6)) 
              (list '(1 2) '(2 2) '(1 2))
            ) 
            (list '(8 12) '(20 30))
    )
  )
)
