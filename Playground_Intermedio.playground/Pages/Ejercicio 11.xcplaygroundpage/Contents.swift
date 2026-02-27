//: [Previous](@previous)

import Foundation

/* Ask the user for a list of 10 different numbers and find the smallest number among those entered.
 */

var numsArray = Array(-100...100).shuffled().prefix(10)
var smallestNumber: Int

print("Numbers: \(numsArray)")
smallestNumber = numsArray[0]

for number in numsArray {
    if number < smallestNumber {
        smallestNumber = number
    }
}

print("The smallest number is \(smallestNumber).")

// Another way (1):
let numsArray2 = Array(-100...100).shuffled().prefix(10)
print("Numbers: \(numsArray2)")
print("The smallest number is \(numsArray2.min()!).")

// Another way using a Set:
var numsSet = Set<Int>()

while numsSet.count < 10 {
    numsSet.insert(Int.random(in: -100...100))
}

let numsArray3 = Array(numsSet)
print("Numbers: \(numsArray3)")
print("The smallest number is \(numsArray3.min()!).")

// Another way using sorted():
let numsArray4 = Array(-100...100).shuffled().prefix(10).sorted()
print("Numbers: \(numsArray4)")
print("The smallest number is \(numsArray4.first!).")

//: [Next](@next)
