#|
Exercise 2.79: Define a generic equality predicate equ? that
tests the equality of two numbers, and install it in the generic
arithmetic package. is operation should work for ordi-
nary numbers, rational numbers, and complex numbers.


ANSWER
------


|#



; Ordinary Numbers

(define (ord-equ? o1 o2)(eq? o1 o2))
(put 'equ? '(ord-num ord-num) ord-equ?) 

; Rational Numbers
(define (rat-equ? r1 r2)(and 
                          (eq? (numerator r1) (numerator r2))
                          (eq? (denominator r1) (denominator r2))))

(put 'equ? '(rat-num rat-num) rat-equ?) 

; Complex

(define (complex-equ? c1 c2)(
                            and 
                          (eq? (real-part c1) (real-part c2))
                          (eq? (img-part c1) (img-part c2))))

(put 'equ? '(complex-num complex-num) complex-equ?)

;; In arithmetic package
(define (equ? n1 n2)(apply-generic 'equ? n1 n2)
