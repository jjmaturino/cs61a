; 2.31

(define (square x)(* x x))

(define square-tree
  (lambda(tree)
    (tree-map square tree)
  )
)

(define (tree-map prod tree)
  (if (null? tree)
    '()
  (map 
    (lambda (node)
      (if (not (pair? node))
        (prod node)
        (tree-map prod node)))
    tree
  ))
)
