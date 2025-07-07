; (car ''abracadabra)

; returns " quote "
; because the string is represented as a list, where each character is car and the next substring is cdr.
; the first character after the string being initialized is " ' ", and thus when car is called, it returns the first character of the string

; Since the quote expresion in scheme " ' ", which allows scheme to interact with symbols withouth evaluating their value,

; Since ' is a special form, and the previous ' makes preceding symbols not be evaluated, when we encounter ' after calling car on the list of strings, we return the object representation of ', which is "quote"
