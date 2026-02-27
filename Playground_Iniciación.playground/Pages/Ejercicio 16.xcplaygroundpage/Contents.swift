//: [Previous](@previous)

import Foundation

/* Design an algorithm that finds the least common multiple of two numbers A and B given by the user. Note: The least common multiple (LCM) is the smallest number that is a multiple of both numbers. */

let a: Int = 4
let b: Int = 6
var lcm: Int = 0

if a > b {
    lcm = a
} else {
    lcm = b
}

while true {
    if lcm % a == 0 && lcm % b == 0 {
        break
    } else {
        lcm += 1
    }
}

print("The LCM of \(a) and \(b) is \(lcm)")

//: [Next](@next)
