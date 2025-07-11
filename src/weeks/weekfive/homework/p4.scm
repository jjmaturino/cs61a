; 2.30


(define square (lambda(x)(* x x)))

(define (square-tree-v1 tree)
  (cond 
    ((null? tree) '())
    ((number? tree) (square tree))
    (else

      (cons 
          (square-tree-v1 (car tree))
          (square-tree-v1 (cdr tree))
          ))
  )
)


(define subtree-square
  (lambda(node)
    (if (not (pair? node))
      (square node)
      (square-tree-v2 node)
    )
  )
)

(define (square-tree-v2 tree)
  (map subtree-square tree) 
)

