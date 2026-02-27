//: [Previous](@previous)

import Foundation

/* Classify a school grade into ranges: A, B, C, D, F.
 Note: The ranges would be A: 90-100, B: 80-89, C: 70-79, D: 60-69, and F: 0-59.
*/

let grade: Double = 59

if grade >= 0 && grade <= 100 {
    if grade >= 90 && grade <= 100 {
        print("A")
    } else if grade >= 80 && grade < 90 {
        print("B")
    } else if grade >= 70 && grade < 80 {
        print("C")
    } else if grade >= 60 && grade < 70 {
        print("D")
    } else {
        print("F")
    }
} else {
    print("The grade must be between 0 and 100.")
}

// Another way with a switch:
if grade >= 0 && grade <= 100 {
    switch grade {
    case 90...100: print("A")
    case 80..<90: print("B")
    case 70..<80: print("C")
    case 60..<70: print("D")
    default: print("F")
    }
} else {
    print("The grade must be between 0 and 100.")
}

//: [Next](@next)
