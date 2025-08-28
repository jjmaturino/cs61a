; 2.38

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))


;(fold-right / 1 (list 1 2 3)) = 3/2 == 1.5
;(fold-left  / 1 (list 1 2 3)) = 1/6 == .16666->
;(fold-right list nil (list 1 2 3)) = (1 (2 (3 ())))
;(fold-left  list nil (list 1 2 3)) ((('(), 1), 2), 3)

; one where order of operation doesn't matter (i.e +, *)
