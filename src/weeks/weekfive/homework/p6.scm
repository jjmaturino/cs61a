; 2.32

;;Reasoning
; -> at each step you have the choice to either include the current number to the subsets generated without it
; -> for each combination (subset) generated, you have to have a variation that includes and discards the current number
; -> we use append because a subset is implmented via a list ds in this example.
;;
(define (missing-piece number subset)
  (append (list number) subset))
)

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda(subset)(append (list (car s)) subset)) rest)))))

(define test-subsets
  (lambda()
    (and
      (equal? (subsets (list 1 2 3)) (list '() (list 3) (list 2) (list 2 3) (list 1) (list 1 3) (list 1 2) (list 1 2 3)) )
    )
  )
)
