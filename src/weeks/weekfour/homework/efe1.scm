; #TODO Extra for experts p1

(define (helper cwd pl)
    (let
      ((curEl (first cwd))
       (rest (bf cwd))
      )
      (if (equal? curEl 'r)
        (if (equal? pl 'a)
          (lambda(i)(car i))
          (lambda(i)(cdr i))
        )
        (helper rest curEl)
      )
    )
  )

(define (cxr-function wd)

  (helper wd "")
)
