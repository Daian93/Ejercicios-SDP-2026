//: [Previous](@previous)

import Foundation

// Design an algorithm that prints a pyramid of asterisks with height N.

let num: Int = 5

 var i: Int = 1
 
 while i <= num {
     var j = 1
     while j <= num - i {
         print(" ", terminator: "")
         j += 1
     }
     
     var k = 1
     while k <= 2 * i - 1 {
         print("*", terminator: "")
         k += 1
     }
     
     print()
     i += 1
 }
 
/*Another way
 var i: Int = 1

 while i <= num {
     let spaces = String(repeating: " ", count: num - i)
     let asterisks = String(repeating: "*", count: 2 * i - 1)
     print(spaces + asterisks)
     i += 1
 }
*/

//: [Next](@next)
