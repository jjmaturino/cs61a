(define (=zero? x) (apply-generic '=zero? x))


; scheme numbers
(put '=zero? '(scheme-number)
     (lambda (x)  (= x 0)))


; rational
(put '=zero? '(rational-number)
    (lambda (x)  (= 0 (numerator x))))

; complex
(put '=zero? '(complex-number)
     (lambda (x) (and
                   (= 0 (img-part x))
                   (= 0 (real-part x)))))

