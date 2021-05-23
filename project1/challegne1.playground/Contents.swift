import UIKit

var str = "Hello, playground"

/* CHALLENGE 1
an optional is a type that handles the absence of a value. optionals say either "there is a valje and it equals x" or "there is no value".

eg:
var myInt: Int? = nil
if myInt != nil {
 print(myInt)
} else {
 print("myInt has nil value)
}
 
if you defined a variable as optional then to ge tthe value from this variable, you have to unwrap it. this means putting an exclamation mark at the end of the variable.

 eg:
 var myString: String?
 
 myString = "Hello world"
 
 if myString != nil {
    print(myString)
 } else {
    print(myString has nil value")
 }
 
 this prints out:
 optional:("hello world")
 
 when applying unwrapping to ge the correct value of the variable:
 eg:
 var myString: String?
 
 myString = "Hello world"
 
 if myString != nil {
    print(myString!)
 } else {
    print("myString has nil value")
 }

 this prints out:
 hello world

 */


/* CHALLENGE 2
 var optionalInt: Int?
 guard let unwrappedInt = optionalInt else {
     print("This is run if optionalInt is nil")
     return
 }
 print("This is run if optionalInt is not nil")
 
*/


/*
 
 
 */
