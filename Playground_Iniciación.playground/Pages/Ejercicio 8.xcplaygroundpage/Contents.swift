//: [Previous](@previous)

import Foundation

/* Design an algorithm that calculates the sum of the first N natural numbers, where N is a value specified by the user. */

let num: Int = 10
var sum: Int = 0

for i in 1...num {
    sum = sum + i
}

/* Another way 1
var i = 1
while i <= num {
    sum = sum + i
    i += 1
}
*/

/* Another way 2
 sum = num * (num + 1) / 2
*/

print("The sum of the first \(num) natural numbers is \(sum).")

//: [Next](@next)
