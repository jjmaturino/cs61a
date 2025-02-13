; # Exercise 4

(define type-check(lambda(fn pdFn args)
                    (if (not (pdFn args))
                      #f
                      (fn args)
                    )
                  )
)

(define (make-safe fn pdFn)
   (lambda(args)(type-check fn pdFn args))
)

(define safe-sqrt (make-safe sqrt number?))
