; Exercise Substitute 2


(define (substitute2 ol nwds owds)
  
  (define (replaceable li el)
    (define (helper sl idx)
      (cond 
        ; if whole list has been traversed and element isnt in the target list, return -1
        ((empty? sl) -1)

        ((equal? el (car sl)) idx) ; return the index of where the element exists

        (else (helper (cdr sl) (+ idx 1)))
      )
    )

    (helper li 0)
  )

  (define (get li idx)
    (if (equal? idx 0)
      (car li)
      (get (cdr li) (- idx 1))
    )
  )


  (cond
    ((null? ol) '())

    ((not (pair? ol))
     (let
       (
        (replaced (replaceable owds ol))
       )
       (if (equal? replaced -1)
         ol
         (get nwds replaced)
       )
     )
    )

    (else
      (cons 
        (substitute2 (car ol) nwds owds)
        (substitute2 (cdr ol) nwds owds)
      )
    )
  )
)


(define test-substitute2
  (lambda()
    (and
      (equal? '((four calling birds) (three french hens) (two turtle doves)) (substitute2 '((4 calling birds) (3 french hens) (2 turtle doves))  '(one two three four) '(1 2 3 4)) )
    )
  )
)
