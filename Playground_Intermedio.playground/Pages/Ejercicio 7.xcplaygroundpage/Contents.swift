//: [Previous](@previous)

import Foundation

/* Calculate how many even and odd numbers there are in a series of numbers from 1 to N, where N is specified by the user.
 */

let number: Int = 7
var evenCounter: Int = 0
var oddCounter: Int = 0

if number > 0 {
    for i in 1...number {
        if i % 2 == 0 {
            evenCounter += 1
        } else {
            oddCounter += 1
        }
    }
    print("There are \(evenCounter) even and \(oddCounter) odd numbers.")
} else {
    print("The number must be greater than 0.")
}

// Another way using .filter:
if number > 0 {
    let evenCounter = (1...number).filter { $0.isMultiple(of: 2) }.count
    let oddCounter = number - evenCounter
    print("There are \(evenCounter) even and \(oddCounter) odd numbers.")
} else {
    print("The number must be greater than 0.")
}

// Another simpler way:
if number > 0 {
    let evenCount = number / 2
    let oddCount = number - evenCount
    print("There are \(evenCount) even and \(oddCount) odd numbers.")
} else {
    print("The number must be greater than 0.")
}

//The shortest way:
print(number > 0 ? "There are \(number / 2) even and \(number - number / 2) odd numbers." : "The number must be greater than 0.")

//: [Next](@next)
