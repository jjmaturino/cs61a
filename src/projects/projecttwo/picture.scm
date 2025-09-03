;; Code for CS61A project 2 -- picture language

(define (flipped-pairs painter)
  (let ((painter2 (beside painter (flip-vert painter))))
    (below painter2 painter2)))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
	(beside painter (below smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
	    (right (right-split painter (- n 1))))
	(let ((top-left (beside up up))
	      (bottom-right (below right right))
	      (corner (corner-split painter (- n 1))))
	  (beside (below painter top-left)
		  (below bottom-right corner))))))

(define (square-limit painter n)
  (let ((quarter (corner-split painter n)))
    (let ((half (beside (flip-horiz quarter) quarter)))
      (below (flip-vert half) half))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
	  (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (identity x) x)

(define (flipped-pairs painter)
  (let ((combine4 (square-of-four identity flip-vert
				  identity flip-vert)))
    (combine4 painter)))

;; or

; (define flipped-pairs
;   (square-of-four identity flip-vert identity flip-vert))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz identity
				  rotate180 flip-vert)))
    (combine4 (corner-split painter n))))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v)
			   (edge1-frame frame))
	       (scale-vect (ycor-vect v)
			   (edge2-frame frame))))))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
	((frame-coord-map frame) (start-segment segment))
	((frame-coord-map frame) (end-segment segment))))
     segment-list)))

(define (draw-line v1 v2)
  (penup)
  (setxy (- (* (xcor-vect v1) 200) 100)
	 (- (* (ycor-vect v1) 200) 100))
  (pendown)
  (setxy (- (* (xcor-vect v2) 200) 100)
	 (- (* (ycor-vect v2) 200) 100)))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
	(painter
	 (make-frame new-origin
		     (sub-vect (m corner1) new-origin)
		     (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
		     (make-vect 0.0 1.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))

(define (shrink-to-upper-right painter)
  (transform-painter painter
		    (make-vect 0.5 0.5)
		    (make-vect 1.0 0.5)
		    (make-vect 0.5 1.0)))

(define (rotate90 painter)
  (transform-painter painter
		     (make-vect 1.0 0.0)
		     (make-vect 1.0 1.0)
		     (make-vect 0.0 0.0)))

(define (squash-inwards painter)
  (transform-painter painter
		     (make-vect 0.0 0.0)
		     (make-vect 0.65 0.35)
		     (make-vect 0.35 0.65)))

(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
	   (transform-painter painter1
			      (make-vect 0.0 0.0)
			      split-point
			      (make-vect 0.0 1.0)))
	  (paint-right
	   (transform-painter painter2
			      split-point
			      (make-vect 1.0 0.0)
			      (make-vect 0.5 1.0))))
      (lambda (frame)
	(paint-left frame)
	(paint-right frame)))))

;;
;; Your code goes here
;;


;;
;; Exercise 2.44: Define the procedure up-split used by corner-split. It is similar to right-split, except that it switches the roles of below and beside.
;;
(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter 
                                  (- n 1))))
        (below painter 
                (beside smaller smaller)))))
;;
;; Exercise 2.45: Right-split and up-split can be expressed as instances of a general splitting operation.
;; 

(define (split s1 s2)
  (define (helper painter n)
    (if (= n 0)
      painter
      (let ((smaller (helper painter 
                                  (- n 1))))
        (s1 painter 
                (s2 smaller smaller)))
    ) 
  )
  
  helper
)

;; 
;; Exercise 2.46:
;; 
(define make-vect cons)
(define xcor-vect car)
(define ycor-vect cdr)

(define (add-vect v1 v2)
  (make-vect
    (+ (xcor-vect v1) (xcor-vect v2))
    (+ (ycor-vect v1) (ycor-vect v2))
  )
)

(define (sub-vect v1 v2)
  (make-vect
    (- (xcor-vect v1) (xcor-vect v2))
    (- (ycor-vect v1) (ycor-vect v2))
  )
)

(define (scale-vect s v)
  (make-vect
    (* s (xcor-vect v))
    (* s (ycor-vect v))
  )
)

;;
;; Exercise 2.47:
;; 
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame f)(car f))
(define (edge1-frame f)(cadr f))
(define (edge2-frame f)(caddr f))


(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame f)(car f))
(define (edge1-frame f)(cadr f))
(define (edge2-frame f)(cddr f))

;;
;; Exercise 2.48:
;;
(define (make-segment v1 v2)(cons v1 v2))
(define (start-segment s)(car s))
(define (end-segment s)(cdr s))

;;
;; Exercise 2.49:
;;
;; The painter that draws the outline of the designated frame.
(define (frame-painter frame)
  (let 
    ((s1 (make-segment (origin-frame frame) (edge1-frame frame)))
    (s2 (make-segment (edge1-frame frame) (make-vect 1 1)))
    (s3 (make-segment (make-vect 1 1) (edge1-frame frame)))
    (s4 (make-segment (edge1-frame frame) (origin-frame frame))))
    (((segments->painter '(s1 s2 s3 s4)) frame))
  )
)

(define (frame-outline-painter)
  (let ((segments
         (list (make-segment (make-vect 0 0) (make-vect 1 0))   ; bottom edge
               (make-segment (make-vect 1 0) (make-vect 1 1))   ; right edge
               (make-segment (make-vect 1 1) (make-vect 0 1))   ; top edge
               (make-segment (make-vect 0 1) (make-vect 0 0))))) ; left edge
    (segments->painter segments)))

;; The painter that draws an “X” by connecting opposite corners of the frame.
(define (x-frame-painter)
  (let ((segments
          (list (make-segment (make-vect 0 0) (make-vect 1 1))
                (make-segment (make-vect 0 1) (make-vect 1 0)))))
    (segments->painter segments))
)

;; The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
(define (diamond-painter)
  (let ((center (make-vect 0.5 0.5))
        (half-diag-right (scale-vect 0.5 (make-vect 1 0)))
        (half-diag-up (scale-vect 0.5 (make-vect 0 1))))
    (let ((right-point (add-vect center half-diag-right))   ; (1, 0.5)
          (top-point (add-vect center half-diag-up))        ; (0.5, 1)
          (left-point (sub-vect center half-diag-right))    ; (0, 0.5)
          (bottom-point (sub-vect center half-diag-up)))    ; (0.5, 0)
      (let ((segments
             (list (make-segment bottom-point right-point)    ; bottom-right
                   (make-segment right-point top-point)       ; top-right
                   (make-segment top-point left-point)        ; top-left
                   (make-segment left-point bottom-point))))  ; bottom-left
        (segments->painter segments))))
)


;;
;; The wave painter.
;;
(define wave
  (segments->painter
   (list (make-segment (make-vect 0.4 1) (make-vect 0.35 0.85))
	 (make-segment (make-vect 0.35 0.85) (make-vect 0.4 0.65))
	 (make-segment (make-vect 0.4 0.65) (make-vect 0.3 0.65))
	 (make-segment (make-vect 0.3 0.65) (make-vect 0.15 0.6))
	 (make-segment (make-vect 0.15 0.6) (make-vect 0 0.85))
	 (make-segment (make-vect 0 0.65) (make-vect 0.15 0.4))
	 (make-segment (make-vect 0.15 0.4) (make-vect 0.3 0.6))
	 (make-segment (make-vect 0.3 0.6) (make-vect 0.35 0.5))
	 (make-segment (make-vect 0.35 0.5) (make-vect 0.25 0))
	 (make-segment (make-vect 0.4 0) (make-vect 0.5 0.3))
	 (make-segment (make-vect 0.5 0.3) (make-vect 0.6 0))
	 (make-segment (make-vect 0.75 0) (make-vect 0.6 0.45))
	 (make-segment (make-vect 0.6 0.45) (make-vect 1 0.15))
	 (make-segment (make-vect 1 0.35) (make-vect 0.75 0.65))
	 (make-segment (make-vect 0.75 0.65) (make-vect 0.6 0.65))
	 (make-segment (make-vect 0.6 0.65) (make-vect 0.65 0.85))
	 (make-segment (make-vect 0.65 0.85) (make-vect 0.6 1)))))

;;
;; Exercise 2.50:
;;

;;
;; Exercise 2.51:
;;

;;
;; Exercise 2.52:
;;



(define full-frame (make-frame (make-vect -0.5 -0.5)
			       (make-vect 2 0)
			       (make-vect 0 2)))
