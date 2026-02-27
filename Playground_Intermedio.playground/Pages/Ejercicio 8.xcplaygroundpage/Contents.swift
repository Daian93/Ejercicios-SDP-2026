//: [Previous](@previous)

import Foundation

/* Find the total number of numbers divisible by 3 in a series of numbers from 1 to N.
 */

let number: Int = 7
var divisibleBy3Counter: Int = 0

if number > 0 {
    for i in 1...number {
        if i % 3 == 0 {
            divisibleBy3Counter += 1
        }
    }
    print("There are \(divisibleBy3Counter) numbers divisible by 3.")
} else {
    print("The number must be greater than 0.")
}

// Another way using .filter:
if number > 0 {
    let divisibleBy3Counter = (1...number).filter { $0 % 3 == 0 }.count
    print("There are \(divisibleBy3Counter) numbers divisible by 3.")
} else {
    print("The number must be greater than 0.")
}

// Another simpler way:
if number > 0 {
    let divisibleBy3Counter = number / 3
    print("There are \(divisibleBy3Counter) numbers divisible by 3.")
} else {
    print("The number must be greater than 0.")
}

//The shortest way:
print(number > 0 ? "There are \(number / 3) numbers divisible by 3." : "The number must be greater than 0.")

//: [Next](@next)
