//: [Previous](@previous)

import Foundation

/*  Create an algorithm that classifies a school grade as "Pass" or "Fail." A pass is a grade of 5 or higher. Create a version that allows you to specify the passing grade. */

// First version with a function

var grade: Int = 7

@MainActor func getGrade() {
    let result = grade >= 5 ? "Pass" : "Fail"
    print("A grade of \(grade) is \(result).")
}

getGrade()

// Second version

let passingGrade: Int = 5
let grade2: Int = 4

let result2 = grade2 >= passingGrade ? "Pass" : "Fail"
print("A grade of \(grade2) is \(result2).")

//: [Next](@next)
