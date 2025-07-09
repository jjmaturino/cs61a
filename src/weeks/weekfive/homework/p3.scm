; 2.29


;; Provided Code
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


;; Problem exercise
(define (left-branch mobile)
  (car mobile)
)

(define (right-branch mobile)
  (cadr mobile)
)

(define test-left-branch-selector
  (lambda ()
    (and
      (equal? (make-branch 10 1) (left-branch (make-mobile (make-branch 10 1) (make-branch 14 8))) )
      (equal? (make-branch 1 10) (left-branch (make-mobile (make-branch 1 10) (make-branch 10 8))) )
      (equal? (make-branch 1 1) (left-branch (make-mobile (make-branch 1 1) (make-branch 10 8))) )
    )
  )
)


(define test-right-branch-selector
  (lambda ()
    (and
      (equal? (make-branch 14 8) (right-branch (make-mobile (make-branch 10 1) (make-branch 14 8))) )
      (equal? (make-branch 10 8) (right-branch (make-mobile (make-branch 1 10) (make-branch 10 8))) )
      (equal? (make-branch 100 100) (right-branch (make-mobile (make-branch 1 1) (make-branch 100 100))) )
    )
  )
)



