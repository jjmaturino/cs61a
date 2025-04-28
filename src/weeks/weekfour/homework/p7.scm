; Exercise 2.22


; Louis' program is return a reversed list because of how the arguments of cons are being initialized
; the car value is being set to the value that you want to append to the back 
; the cdr value is being set to the current list value.
;
; this is causing new values to be added to the front of the list rather than the back, thus reversing the desired output

; Even when the arguments are swapped, the program still errors
; This is due to how the iter-helper is initialized
; the argument that keeps track of the current list value is defined as nil
; This will cause an error when appending the first valid member to the list,
; because the car will be nil, and the cdr will be the first member.
; What should occur is that a list should be initialized, and then the new member can be appended via the cdr arguement to cons
