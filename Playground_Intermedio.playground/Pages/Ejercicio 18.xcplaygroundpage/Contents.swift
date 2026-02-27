//: [Previous](@previous)

import Foundation

/* Calculate the sum of the digits of a number until the result is a single digit. For example, for 942, the sum would be 9+4+2 = 15, and then 1 + 5 = 6.
 Hint: You will need to divide by multiples of 10 to get each digit separately.
 */

// Default value for testing
var number = 673

// Repeat until it is a single digit
while number >= 10 {
    var sum = 0
    var temp = number

    while temp > 0 {  // Extract each digit
        sum += temp % 10  // Get last digit
        temp /= 10  // Remove last digit
    }

    number = sum  // Prepare for next iteration
}

print("Final single digit: \(number)")

//: [Next](@next)
