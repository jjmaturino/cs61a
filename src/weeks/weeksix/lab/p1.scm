; It's a pair, so we go to the last case:
; We evaluate the operator: its a lambda, which is self evaluating -> returns a lambda
; We evaluate the operands: returns 5

; We use apply to apply the operand to the operator
; We call substitute to insert variable values for formal parameters.
; Since (+ 5 3) is a list, we evaluate it

; return 8
