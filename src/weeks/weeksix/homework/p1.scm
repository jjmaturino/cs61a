(define (attach-tag type-tag contents)(cons type-tag contents))

#|
  ## Note: apply-generic assumes all arguments are tagged

  The current `apply-generic` expects all arguments to have type tags.
  For `(get-record employee-name personnel-file)`, only the personnel-file is tagged.

  **Current workaround:** 
  Manually call `get` using only the personnel-file's type, then apply the 
  retrieved procedure to both the employee-name and file contents.

  **Future enhancement:**
  Modify `apply-generic` to handle mixed tagged/untagged arguments by marking 
  untagged values and filtering them out of the type lookup.
|#

(define (apply-generic op . args)

  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc (apply proc (map contents args))
        (error
          "No method for these types: APPLY-GENERIC"
          (list op type-tags))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (install-x-division-package)
  (

   ; interface to whole system
   (define (tag x)(attach-tag 'x-division' x))

   (put '_get-name '(x-division) _get-name)
   (put '_get-salary '(x-division) _get-salary)
   (put '_get-record '(x-divison) get-record)

))



(define (headquarters)
  (install-x-divsion-package)

  #|
    1. get record 

    ----
      Individual division code should be separated into distinct packages.
      
      The packages should tag the concrete data object with a type (division name) so that 
      the relevant operations can be retrieved.

      In other words, every object that is returned by the packaged should be typed to the package, 
      so that we can apply generic operators that a.) look up the associated procedure, and b.) call that procedure with the contents
      of the typed data structure
  |#

  (define (get-record division-file employee-name)
    ((get '_get-record (type-tag division-file)) employee-name (contents division-file))
  )

  #|
    2. get salary

    For this to work, the employee file must be typed, so that we can make a lookup call for the associated procedure
    that was registered.
  |#
  (define (get-salary employee-file)((get '_get-salary (type-tag employee-file)) (contents employee-file)))

  #|
    3. find-employee-record
  |#
  (define (find-employee-record divisions employee-name)
    (map (lambda(d)(get-record d employee-name)) divisions)
  )


)


#|
    d. When Insatiable takes over a new company, what changes
    must be made in order to incorporate the new person-
    nel information into the central system?

---------

  0.) They need to implement all methods associated with the abstract data type of 'division
  1.) Type all methods with a value relevant to concrete implementation
  2.) They need to add concrete implementation into table that is used for data directed programming, which leverages types - using (put ...)
  3.) Install package for use

|#
