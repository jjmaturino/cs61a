#|

Exercise 2.77: Louis Reasoner tries to evaluate the expres-
sion (magnitude z) where z is the object shown in Figure
2.24. To his surprise, instead of the answer 5 he gets an error
message from apply-generic, saying there is no method
for the operation magnitude on the types (complex). He
shows this interaction to Alyssa P. Hacker, who says “the
problem is that the complex-number selectors were never
defined for complex numbers, just for polar and rectangular
numbers. All you have to do to make this work is add the
following to the complex package:”

(put 'real-part '(complex) real-part)
(put 'imag-part '(complex) imag-part)
(put 'magnitude '(complex) magnitude)
(put 'angle '(complex) angle)

Describe in detail why this works. As an example, trace
through all the procedures called in evaluating the expres-
sion (magnitude z) where z is the object shown in Figure
2.24. In particular, how many times is apply-generic in-
voked? What procedure is dispatched to in each case?



ANSWER
------

    This works because the selectors (real-part, imag-part, magnitude, and angle) are generic operators, which implement apply-generic.


    When real-part, or any selector, is called on a complex data type [type: complex, content:[concrete complex type (polar, rect, etc]]

    We first retreive the procedure that is indexed on the argument type 'complex and the procedure 'real-part.

    We would pass the complex tagged type into the generic selector, which implements apply-generic.

    First, apply-generic would first find the procedure that is keyed to the type 'complex and selector, which is also the generic selector,
    and call the procedure with the content of the complex tagged type.

    Next, we  call the retrieved procedure from the previous step, which is the same selector that implements apply-generic, to the contents.

    Since the contents at this step, is a concrete complex type representation, when apply generic goes to retrieve the associated procedure and then apply the procedure to the contents
    of tagged type, it will call a concrete procedure with the content as arguments.


    Apply-Generic is applied: 2 Times

    Manual Trace:

    z = is the typed data structure where the type is 'complex and the content (c) is a typed data structure which represents different concrete implementations of a complex number.

    Call 1: (magnitude z)
    -> arguments get passed into apply-generic

    Call 2: (apply-generic z):
    -> apply-generic a.) strips out type of arguments, then looks up the stored procedure based on the arguement type. The returned procedure is (magnitude). And then calls magnitude with the 
    contents of z.


    Call 3: (magnitude c):
    -> arguments get passed into apply-generic

    Call 4: (apply-generic c):
    -> apply-generic a.) strips out type of arguments, then looks up the stored procedure based on the argument type. The returned procedure is (the concrete procedure that returns the magnitude for a concrete complex number implmentation). And then calls the concrete proceedure with the 
    contents of c.


    Call 5: (concrete-magnitude x):
    -> the concrete call returns the desired value after execution.
|#


