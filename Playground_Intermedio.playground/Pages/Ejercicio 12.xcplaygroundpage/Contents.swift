//: [Previous](@previous)

import Foundation

/* Given a year, determine whether it is a leap year or not.
 Note: A year is a leap year if it is divisible by 4, except when it is divisible by 100 but not by 400. For example, the year 2000 was a leap year because, although it is divisible by 100, it is also divisible by 400. However, the year 1900 was not a leap year because, although it is divisible by 4 and 100, it is not divisible by 400.
 */

// Default value for testing
let year = 2000

var isLeapYear = false

if year % 4 == 0 {
    if year % 100 == 0 {
        if year % 400 == 0 {
            isLeapYear = true
        } else {
            isLeapYear = false
        }
    } else {
        isLeapYear = true
    }
} else {
    isLeapYear = false
}

if isLeapYear {
    print("\(year) is a leap year.")
} else {
    print("\(year) is not a leap year.")
}

// A cleaner version
let year2 = 1900

if (year2 % 4 == 0 && year2 % 100 != 0) || (year2 % 400 == 0) {
    print("\(year2) is a leap year.")
} else {
    print("\(year2) is not a leap year.")
}

// Using a function
func isLeapYear(_ year: Int) -> Bool {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)
}

let year3 = 2024

if isLeapYear(year3) {
    print("\(year3) is a leap year.")
} else {
    print("\(year3) is not a leap year.")
}

//: [Next](@next)
