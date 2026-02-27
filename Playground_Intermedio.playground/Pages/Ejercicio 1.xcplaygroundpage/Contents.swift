import Foundation

/* Determine the category of a triangle based on the size of its sides, which the user will have to enter.
 Note: They can be equilateral (all three sides are equal), isosceles (two sides are equal and one is different), and scalene (all three sides are different).
 */

let a: Double = 1.5
let b: Double = 2
let c: Double = 1.5

func isValidTriangle(_ a: Double, _ b: Double, _ c: Double) -> Bool {
    return a + b > c && a + c > b && b + c > a
}

if isValidTriangle(a, b, c) {
    if a == b && b == c {
        print("The triangle is equilateral.")
    } else if a == b || b == c || a == c {
        print("The triangle is isosceles.")
    } else {
        print("The triangle is scalene.")
    }
} else {
    print("The triangular inequality is not satisfied.")
}

// Another way using a switch:
switch (a, b, c) {
case (let x, let y, let z) where !(x + y > z && x + z > y && y + z > x):
    print("The triangular inequality is not satisfied.")
case (let x, let y, let z) where x == y && y == z:
    print("The triangle is equilateral.")
case (let x, let y, let z) where x == y || y == z || x == z:
    print("The triangle is isosceles.")
default:
    print("The triangle is scalene.")
}
