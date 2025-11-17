#|
  Suppose you are designing a generic arith-
  metic system for dealing with the tower of types shown in
  Figure 2.25: integer, rational, real, complex. For each type
  (except complex), design a procedure that raises objects of
  that type one level in the tower. Show how to install a
  generic raise operation that will work for each type (ex-
  cept complex).

|#


;;;
;;; Integer package
;;;

(define (install-scheme-number-package)
  (
   (define (scheme-number->rational n)(make-rational n 1))
   (put 'raise 'scheme-number scheme-number->rational)))


;;;
;;; Rational package
;;;

(define (install-rational-package)
  (
   (define (rational->real n)(make-real (/ (numerator n) (denominator n))))
   (put 'raise 'rational rational-real)))

;;;
;;; Real package
;;;

(define (install-real-package)
  (
   (define (real->complex n)(make-complex-from-real-imag n 0))
   (put 'raise 'real real-complex)

  ))


;;;
;;;  Complex package
;;;



(define (install-number-packages)
  (install-integer-package)
  (install-rational-package)
  (install-real-package)
  (install-complex-package))

(install-number-packages)
