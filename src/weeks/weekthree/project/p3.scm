(load "project/p2")
(load "project/twenty-one")


; hard to test because the games are non-deterministic
; Easy to test if we could inject a deck, in which we know the order. and thus can deterministically
; figure out if a strategy will work for that deck instance


(define (play-n strategy n)
  (play-n-helper strategy n 0)
)


(define (play-n-helper strategy n aggregate)
  (if (equal? n 0)
    aggregate
    (play-n-helper strategy (- n 1) (+ aggregate (twenty-one strategy)))
  )
)
