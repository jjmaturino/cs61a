; joker exercise
; we have to extend best-total in order to account for joker value
; Functions that need to be changed to allow for handling of jokers.
; 
; I'm not going to copy the contents of all the files into this one.
; I'm just documenting what files I changed, and adding a (play-n ) function call
; to test that the game isn't broken
; 
; twenty-one -> make-ordered-deck: this is where new card types are added
;
; p1 -> best-total-helper; This is where the joker value is defined. similiar to how ace value is defined
; p1 -> added jokervalue and joker helper functions

