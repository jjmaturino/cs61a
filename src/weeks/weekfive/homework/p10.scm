; 2.54

(define checkSymbol 
  (lambda (x y)
    (eq? x y)
  )
)





(define (equalHW? x y)
  (cond 
    ((and (null? x) (null? y)) #t) ;; Base case: both empty lists
    ((or (null? x) (null? y)) #f) ;; One empty, one not
    ((or (not (list? x)) (not (list? y))) #f) ;; One is list, one is symbol  
    ((and (not (list? x)) (not (list? y))) (eq? x y)) ;; Both are symbols 
    (else (and (equalHW? (car x) (car y))
               (equalHW? (cdr x) (cdr y))))))     ;; Both are lists: check first elements and rest

