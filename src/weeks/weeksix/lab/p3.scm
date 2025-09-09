; 
; (map first '(the rain in spain))
; 
;; EXPLANATION
;; Since the first two functions are from stk library, the are immediate evaluated by eval-1
;; in the constant predicate function.
;; the list is evaluated as a symbol by stk
;
;; EXPLAINATION
; (map (lambda (x) (first x)) '(the rain in spain))
;;
;; map gets returned because its a stk function
;; -> then its arguments get evaluated
;; -> lambda process is different
;; -> eval for list is the same
;;
;; lambda is returned as the symbolical value stored in scheme-1 

;; Apply-1 calls apply to call the stk map procedure with the symbolic representation of a lambda and list
;; which are evaluated as primitives in stk
