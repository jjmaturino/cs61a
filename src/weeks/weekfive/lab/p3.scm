; (car ''abracadabra)

; returns " ' "
; because the string is represented as a list, where each character is car and the next substring is cdr.
; the first character after the string being initialized is " ' ", and thus when car is called, it returns the first character of the string
