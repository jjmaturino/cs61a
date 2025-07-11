; 2.29


;; Provided Code
(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


;; p1: Selectors
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



(define (branch-length branch)
  (car branch)
)

(define (branch-structure branch)
  (cadr branch)
)

(define test-branch-length
  (lambda ()
    (and 
      (equal? 10 (branch-length (make-branch 10 1)))
      (equal? 1 (branch-length (make-branch 1 120)))
      (equal? 57 (branch-length (make-branch 57 1)))
      (equal? 57 (branch-length (make-branch 57 (make-branch 10 1))))
    )
  )
)


(define test-branch-structure
  (lambda ()
    (and 
      (equal? 1 (branch-structure (make-branch 10 1)))
      (equal? 120 (branch-structure (make-branch 1 120)))
      (equal? 7 (branch-structure (make-branch 57 7)))
      (equal? (make-branch 10 1) (branch-structure (make-branch 57 (make-branch 10 1))))
    )
  )
)

; -- p2 : Total Weight of a mobile

; Since a mobile is a type of tree structure, using lists to implement hierachical structuring, we can 
; use list as interfaces to traverse the hierachy

(define mobile1 (make-mobile 
                  (make-branch 10 50) 
                  (make-branch 14 50))
)
(define mobile2 (make-mobile 
                  (make-branch 10 100) 
                  (make-branch 1
                      (make-mobile 
                        (make-branch 4 50) 
                        (make-branch 4 25))
                  )
                )
)

(define mobile3 (make-mobile 
                  (make-branch 10 
                               (make-mobile 
                                 (make-branch 14 1) 
                                 (make-branch 8 
                                              (make-mobile 
                                                (make-branch 14 8) 
                                                (make-branch 14 7))))) 
                  (make-branch 1 
                               (make-mobile 
                                 (make-branch 14 5) 
                                 (make-branch 14 2)))))

(define mobile4 (make-mobile 
                  (make-branch 10 13) 
                  (make-branch 10 14)))


(define mobile4-1 (make-mobile 
                  '() 
                  (make-branch 10 14)))



(define test-total-weight
  (lambda()
    (and
      (equal? 100 (total-weight mobile1))
      (equal? 175 (total-weight mobile2))
      (equal? 23 (total-weight mobile3))
      (equal? 27 (total-weight mobile4))
      (equal? 14 (total-weight mobile4-1))
    )
  )
)

; we want to run total-weight on every sub-mobile
; a mobile with no submobiles will return it's weight
; a mobile has no submobiles  if it's left branch and right branch points to only weights

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (cond 
      ((null? branch) 0)
      ((number? structure) structure)
      (else (total-weight structure))
    )
  )
)

(define (total-weight mobile)
  (reduce + (map branch-weight (filter (lambda(branch)(pair? branch )) mobile)))
)

; p3; balanced predicate function

(define balancedmobile (make-mobile
                         (make-branch 5 4)
                         (make-branch 4 5)
                        )
)


(define unbalancedmobile (make-mobile
                          (make-branch 5 5)
                          (make-branch 1 5)
                        )
)


(define complex-unbalancedmobile (make-mobile
                                  (make-branch 5 
                                               (make-mobile
                                                 (make-branch 10 10)
                                                 (make-branch 5 7)
                                                 ))

                                  (make-branch 4 5)
                                  )
)



(define test-is-balanced?
  (lambda()
    (and
      (equal? #t (is-balanced? balancedmobile))
      (equal? #f (is-balanced? unbalancedmobile))
      (equal? #f (is-balanced? complex-unbalancedmobile))
    )
  )
)

(define (is-mobile? object)
  (pair? (cdr object) and  )
)

(define (is-branch? object)
  (number? (car object))
)


(define (get-torque branch)
  (let
    (
      (structure (branch-structure branch))
      (blength (branch-length branch))
    )
    (cond
      ((null? branch) 0)
      ((number? structure) (* blength structure))
      (else (* blength (total-torque structure)))
    )
  )
)


(define (total-torque mobile)
    (reduce + (map get-torque (filter (lambda(child)(pair? child)) mobile)))
)


(define (level-balanced? mobile)
  (let
    (
     (left-mobile (get-torque (left-branch mobile)))
     (right-mobile (get-torque (right-branch mobile))))
  
    (equal? left-mobile right-mobile)
  )
)



(define branches-balanced?
  (lambda (mobile)
    (and
      (branch-balanced? (left-branch mobile))
      (branch-balanced? (right-branch mobile))
    )
    
  )
)



(define (branch-balanced? branch)
  (let ((structure (branch-structure branch)))
    (if (number? structure)
      #t
      (is-balanced? structure)
    )
  )
)


(define (is-balanced? mobile)
  (and 
    (branches-balanced? mobile)
    (level-balanced? mobile)
  )
)


;;---
; p4 

; If we changed the implementation from a list to a cons implementation, we would have to change alot.
; 
; This is due to using list comprhension to traverse the list.
;
; In hindesight, this breaks data abstractions because we aren't exclusively using the selector methods.
; this is shown by the fact that a change in how we implement these compound data structures, would cause wide ranging effects on the 
; methods that interact with these data structures
