//: [Previous](@previous)

import Foundation

/*: Desarrolla un algoritmo que calcule el área y el perímetro de un triángulo dados los tres lados.
 ALGORITMO: Para el perímetro, suma los tres lados. Para el área, puedes usar la fórmula de Herón: Primero calcula el semiperímetro s = (a + b + c) / 2, luego el área = √(s × (s-a) × (s-b) × (s-c)). */

let a: Double = 5
let b: Double = 6
let c: Double = 7

// Calculate perimeter
let perimeter = a + b + c

// Calculate semiperimeter
let s = perimeter / 2

// Calculate area using Heron's formula
let area = sqrt(s * (s - a) * (s - b) * (s - c))

print("Triangle sides: a=\(a), b=\(b), c=\(c)")
print("Perimeter: \(perimeter)")
print("Area: \(area)")

//: [Next](@next)
