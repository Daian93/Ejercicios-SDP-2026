//: [Previous](@previous)

import Foundation

/* Create an algorithm that prints the Fibonacci series up to the tenth term. Note: The Fibonacci series is a sequence where each number is the sum of the previous two: 0, 1, 1, 2, 3, 5, 8 ... */

var a = 0
print("\(a)")
var b = 1
print("\(b)")

for _ in 2..<10 {
    let c = a + b
    print("\(c)")
    a = b
    b = c
}
 
/* Another way
var i = 3
while i <= 10 {
    let c = a + b
    print("\(c)")
    a = b
    b = c
    i += 1
}
*/

//: [Next](@next)
