#|

    As a large system with generic operations
    evolves, new types of data objects or new operations may
    be needed.


    Below is a description of how the three different methodologies(explicit dispatch, data-directed style, and message-passing style) 
    of adding new data object / operations would be realized; 


    let (n) be the number of types and (m) be the number of methods

    1. Explicit Dispatch

      a.) Adding new methods, same types:
          
          When adding a new method(mx), you need to make sure that every type, n, is handled. Else the method will not be reliable. 

          There are n additions that must be made

    
      b.) Same methods, adding new types:
        
          When adding a new type(nx), you must make sure that for every exisiting method (m), the method adds an explicit dispatch for
          the new type.
          
          There are m additions that must be made
          

    2. Data-Directed Style
          Description: the process where data types are given a label(type) associated to a package or concrete implementation 
          of a generic operation.

          These concrete representations are registered so that they can be queried by the generic representation by the labels(type)
          that the arguments are attached with. 
          
          Key Feature: the data object "owns" the operations.
        

      a.) Adding new methods, same types:
        
        When adding a new method, we would have in the body of the generic method a call to retrieve the procedure associated with the 
        typed arguments. 
      
        We would then call that procedure with the typed arguments.

        For each permutation of types that the procedure would be called with we would have to create a concrete procedure that would
        be called for those arguments, and then register the procedure in a table of sorts, so that, it can be queried for by the generic 
        procedure


        Worst case scenario we would implement n new concrete procedures

      b.) Same methods, adding new types:

        When adding a new type, we would only be adding new concrete representations of the generic procedure calls. We would register those
        concrete representations such that they can be retrieved when the  generic procedure calls recieve the new types as arguments.


      Worst case scenario we would implement m new concrete procedures


      CALLOUT: in either case we would not be modifying exisiting generic procedures. The code process is additive. We aren't refactoring.


    3. Message-Passing Style
        
          Description: the process where the concrete types are implemented as procedures to represent data types.
            When called, they return procedures act on the data represented in the data types.
        

      a.) Adding new methods, same types:
          When adding a new method, we would have to modify each existing type that could be passed as arguements to the method.

          In each type we would add an explicit dispatch on the procedure name to call a method that describes how the type should be processed
          when called by a specific procedure.
        

          Additions are n


      b.) Same methods, adding new types:
          When adding a new type, we would add a new type that has a dispatch procedure it calls when it is called as an argument 
          for a procedure.


          Additions are m


    Which organization would be most appropriate for a system in which new types must often be added?

      In a system where the types are applied to a small subset of operations I would lean towards the data-defined style.

      The addition of a new type would be isolated to a new type package that would a.) define the type 
      and type selectors and b.) definition and registration of the concrete methods associated with the type.
      
      Since types "own" their own operations, message passing would also be a suitable solution.

    
      Both data-directed and message-passing work well for adding types, since you just create a new package (data-directed) 
      or a new procedure (message-passing) without modifying existing code.

      This occurs because the new type author is responsible for the implementation, and because both dd and mp isolate 
      new code withouth modifying existing code.

    Which would be most appropriate for a system in which new operations must often be added?
  
      For systems where new operations occur often I would lean towards  data defined programming. BY choosing data-defined approach,
      the author of the new method has the ability to choose how each type will interact with method.

      On the other hand, by allowing the type to own the "operation", each type author would have to understand the reasoning for why the
      new operation was created and thus write the code for it.
      
|#


