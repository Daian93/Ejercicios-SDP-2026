//: [Previous](@previous)

import Foundation

/* Calculate the day of the week for a given date.
 Note: Use Zeller's formula to determine the day of the week.

 h=(q+⌊13(m+1)/5⌋+K+⌊K/4⌋+⌊J/4⌋-2×J)mod 7

 The mod operator represents the modulus of division or remainder of a division. For example, 10 mod 3 = 1.

 In the formula, the nomenclature is: h is the day of the week (0 = Saturday, 1 = Sunday, 2 = Monday, etc.), q is the day of the month, m is the month starting with March as month 1, so December is 10 and January of the following year is 11, with February being 12. K is the year of that century and J is the century.
 */

// Default dates for testing
var day = 13
var month = 11
var year = 2025

// We save que original date for not losing the exact day, month and year
let originalDay = day
let originalMonth = month
let originalYear = year

// Zeller adjustment
if month == 1 {
    month = 13
    year -= 1
} else if month == 2 {
    month = 14
    year -= 1
}

let q = day
let m = month
let K = year % 100
let J = year / 100

let h = (q + (13 * (m + 1)) / 5 + K + K / 4 + J / 4 + 5 * J) % 7

var dayName = ""

switch h {
case 0: dayName = "Saturday"
case 1: dayName = "Sunday"
case 2: dayName = "Monday"
case 3: dayName = "Tuesday"
case 4: dayName = "Wednesday"
case 5: dayName = "Thursday"
case 6: dayName = "Friday"
default: dayName = "Error"
}

print(
    "The date \(originalDay)/\(originalMonth)/\(originalYear) is a \(dayName)."
)

//: [Next](@next)
