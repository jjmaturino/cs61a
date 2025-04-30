; Subsitute problem for homework pdf


(define substitute
  (lambda(l ow nw)
    (cond
      ; return null if list is null (the previous recursive call is expecting a null value for it's cdr -> signifies a terminated pair/list ds)
      ((null? l) '())

      ;  if equals the old word, swap with new word 
      ((not (pair? l)) (if (equal? l ow) nw l))

      (else
        (cons
          (substitute (car l) ow nw)
          (substitute (cdr l) ow nw)
        )
       )
     )
  )
)




(define test-substitute
  (lambda()
    (and
      (equal? '((lead axe) (bass axe) (rhythm axe) drums) (substitute '((lead guitar) (bass guitar) (rhythm guitar) drums) 'guitar 'axe))
      (equal? '((juans dancing is awesome) (juans pottery is awesome) (juans coding skills are awesome) guitar) (substitute '((juans dancing is horrible) (juans pottery is horrible) (juans coding skills are horrible) guitar) 'horrible 'awesome))
    )
  )
)
