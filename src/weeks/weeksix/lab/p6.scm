(define preorder-notation '(5 3 1 () () () 9 7 () () 11 () ()))

(define deserialize-helper
  (lambda (lst)
    (cond
      ((null? lst) (cons '() '()))
      ((null? (car lst)) (cons '() (cdr lst)))  ; This is when you hit '() in the list
      (else
        (let 
          ((root (car lst))
          (left_results (deserialize-helper (cdr lst))))
          ; body
          (let 
            ((left_subtree (car left_results))
             (rest_list (cdr left_results)))
            (let
              ((right_results (deserialize-helper rest_list)))
              (cons (make-tree root left_subtree (car right_results)) (cdr right_results))
            )
          )
        )
        ))))
                          

(define deseralize-tree 
  (lambda (l1)
    (car (deserialize-helper l1))))


(define t0  (adjoin-set 4 (deseralize-tree preorder-notation)))
(define t1 (adjoin-set 11 (adjoin-set 9 (adjoin-set 5 (adjoin-set 1 (adjoin-set 3 (adjoin-set 7 '())))))))
(define t2 (adjoin-set 11 (adjoin-set 9 (adjoin-set 5 (adjoin-set 7 (adjoin-set 1 (adjoin-set 3 '())))))))
(define t3 (adjoin-set 11 (adjoin-set 7 (adjoin-set 9 (adjoin-set 1 (adjoin-set 3 (adjoin-set 5 '())))))))
