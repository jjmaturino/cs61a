;;
;; Tracing ((lambda (x) (+ x 3)) 5)

; It's a pair, so we go to the last case:
	;((pair? exp) (apply-1 (EVAL-1 (car exp))      ; eval the operator
  ;	      (map eval-1 (cdr exp))))


  ; We need to evaulate the opeartor (lambda(x)(+ x 3))
  ; (EVAL-1 (car expr))
  
  ; In eval, one , argument from last step (car expr) 
  ; Triggers this predicate statement
  ; 	((lambda-exp? exp) exp)
  ; Thus returning the lambda function (lambda $(+ x 3))

  ; We need to evalulate the operand (3)
  ; (EVAL-1 (cadr expr))
  
  ; 3 is self evaluating/consitent expression; returns 3

  ; we run apply-1 with the previously returned values.

  ; this statement gets triggered
  ;  " (eval-1 (substitute (caddr proc)
  ;       (cadr proc)
	;		     args
	;		     '())))


  ; Then substitute gets called recursively so that each formal paramter is the body of the lambda exp
  ; is swapped with the values provided by the arguments to the function

  ; apply gets the subsituted version and calls eval-1 with this value
  ; which then gets passed to stk to be evaluated and applied
  
  ; return value 8

