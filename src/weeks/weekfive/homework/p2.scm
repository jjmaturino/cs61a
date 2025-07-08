; 2.26

; Suppose we define x and y to be two lists:

; (define x (list 1 2 3))
; (define y (list 4 5 6))


; How do these get eval'd?

;(append x y) -> two or more lists, get turned into one with all of the elements
; (1 2 3 4 5 6)

;(cons x y) -> car is x, cdr is y.

; ( (1 2 3) 4 5 6)

;(list x y) -> both lists become sublists
; ( (1 2 3) (4 5 6)


