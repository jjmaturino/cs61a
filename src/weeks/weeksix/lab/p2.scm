

; Length 

((lambda (n)           
   ((lambda (length) (length length n))  ; Y-combinator application
    (lambda (length n)  ; The recursive implementation
      (if (null? n)
          0
          (+ 1 (length length (cdr n))))))
 ) (list 1 1 1))
