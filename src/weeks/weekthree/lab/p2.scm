#|
  Q2

  When counting change from largest denomination to smallest, you're reducing the amounts faster, leading to a shallower recursive tree. 

  When processing from smallest denomination to largest, you have to check every other value even if it will end in an invalid state

  IN other words

  by count from larget denomination to smallest, you're reapeating less instances of invalid paths because
  you figure out which change combinations end in an invalid state.

  when counting from smallest to largest, you have to repeat invalid states even if they have already been traversed in a previous branch and found to be invalid
|#

