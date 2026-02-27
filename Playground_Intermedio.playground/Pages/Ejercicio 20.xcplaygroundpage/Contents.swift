//: [Previous](@previous)

import Foundation

/* Calculate a person's age given their date of birth and the current date.
 Note: Be sure to consider leap years for an accurate age calculation.
 */

import Foundation

// Birth date for testing
let birthDay = 13
let birthMonth = 11
let birthYear = 1993

// Current date for testing
let currentDay = 10
let currentMonth = 2
let currentYear = 2026

var age = currentYear - birthYear

// Check if birthday has occurred this year
if currentMonth < birthMonth || (currentMonth == birthMonth && currentDay < birthDay) {
    age -= 1
}

print("The person is \(age) years old.")
//: [Next](@next)
