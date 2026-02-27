//: [Previous](@previous)

import Foundation

/*: Implementa un algoritmo para determinar si un año es bisiesto.
 ALGORITMO: Un año es bisiesto si es divisible por 4, excepto si es divisible por 100 a menos que también sea divisible por 400. Por ejemplo, 2000 y 2400 son bisiestos, mientras que 1800, 1900, 2100, 2200 y 2300 no lo son. */

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
