; mystery exercise


(define (mystery L1 L2)
  (append
    L2
    (cons L2 L1)
    L1
  )
)

