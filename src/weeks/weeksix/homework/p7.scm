

#|

a.) 
    If exp was called with type complex arguments, it would cause a stack overflow due to infinite recursion.

    The apply generic would do a lookup for 'exp on types complex, when it wasn't found, it would lookup coercion procedures
    the first argument would be coerced to become itself. 

    Then apply-generic would be called again with the same arguments.


b.)   ANSWER: Louis is incorrect in certain cases and correct in others.
      Apply-generic works as is if and only if we don't define coercion procedures that map the type to itself.

      REASONING:
      In the case where apply generic doesn't find a procedure keyed to the arguments types,
      
      It will look for coercion procedures for each type,

      If none are found, then the apply-generic procedure will return an error.

      Even if apply-generic looks for a coercion procedure betweent the same type, it will return none, and thus not try to coerce the types

      In the case where a programmer has defined coercion procedures that map a type to itself, we must add a condition to check that the types 
      aren't the same type, or else we will result in a stack overflow from infinite recursion.

c.)   Modify apply-generic so that it doesn’t try coercion
      if the two arguments have the same type.
|#


(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
        (apply proc (map contents args))
        (if (= (length args) 2)
          (let (
            (type1 (car type-tags))
            (type2 (cadr type-tags))
            (a1 (car args))
            (a2 (cadr args)))
            
            
             (if (eq? type1 type2)
               (error "No method for these types" (list op type-tags))
               (let (
                (t1->t2 (get-coercion type1 type2))
                (t2->t1 (get-coercion type2 type1)))
                  (cond 
                    (t1->t2 (apply-generic op (t1->t2 a1) a2))
                    (t2->t1 (apply-generic op a1 (t2->t1 a2)))
                    (else (error "No method for these types" (list op type-tags)))))))

            (error "No method for these types"(list op type-tags)))))))
