//: [Previous](@previous)

import Foundation

/* Develop an algorithm that solves a quadratic equation ax^2+bx+c=0 with coefficients a, b, and c entered by the user.
 Note: The solutions to a quadratic equation are calculated using the following general formula: x=(-b±√(b^2-4ac))/2a.
 */

// Default coefficients for testing
let a = 2.0
let b = -4.0
let c = -6.0

// First validate that a is not zero
if a == 0 {
    print("This is not a quadratic equation (a cannot be 0).")
} else {
    
    let discriminant = b * b - 4 * a * c
    
    if discriminant > 0 {
        // Two real solutions
        let x1 = (-b + sqrt(discriminant)) / (2 * a)
        let x2 = (-b - sqrt(discriminant)) / (2 * a)
        
        print("Two real solutions:")
        print("x1 = \(x1)")
        print("x2 = \(x2)")
        
    } else if discriminant == 0 {
        // One real solution
        let x = -b / (2 * a)
        
        print("One real solution:")
        print("x = \(x)")
        
    } else {
        // No real solutions
        print("No real solutions.")
    }
}

//: [Next](@next)
