; Exercise 2
(define substitute (lambda (currentsentence ow nw) (
			cond ((empty? currentsentence) '() )
			     ((equal? (first currentsentence) ow)
				(se nw (substitute (bf currentsentence) ow nw))
			      )
			     (else
				(se (first currentsentence) (substitute (bf currentsentence) ow nw))
			      )
		)
	)
)
