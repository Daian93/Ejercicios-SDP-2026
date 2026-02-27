//: [Previous](@previous)

import Foundation

/* Create an algorithm that determines whether a number is a palindrome. Note: A palindrome is a number that reads the same from left to right as it does from right to left. */

var num: Int = 121

let original: Int = num
var reversed: Int = 0
var digit: Int
 
while num != 0 {
    digit = num % 10
    reversed = reversed * 10 + digit
    num = num / 10
}

if original == reversed {
    print("The number \(original) is a palindrome.")
} else {
    print("The number \(original) is not a palindrome.")
}

//: [Next](@next)
