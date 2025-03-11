; Exercise 1.38

(define (euler-n i) 1.0 )

;  1, 2, 1, 1, x, 1, 1, x, 1, 1, x
;  0  1  2  0  1, 2, 0, 1 ... mod 3
;  0  1  2  3  4, 5, 6, 7 ... index
;  0  1  0  0  2  0  0  3  0  0  4  ... x instance of mod 3

; with index one
;  1, 2, 1, 1, x, 1, 1, x, 1, 1, x ... each number with a value of 2 mod 3, has a value associated with 2 times the x instance of 2 mod 3 starting from zero
;  1  2  0  1  2  0  1    ... mod 3
;  1  2  3  4  5  6  7  8 ... index
;  -  1  -  -  2  -  -  3 ... (index + 1) / 3 -> i.e multiples of 3


(define (euler-d i)
  (if (not (equal? (modulo i 3) 2))
    1
    (* 2 (/ (+ i 1) 3)) 
  )
)
        
