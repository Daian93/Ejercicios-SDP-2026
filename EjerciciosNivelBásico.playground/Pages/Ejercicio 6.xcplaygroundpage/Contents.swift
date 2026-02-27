//: [Previous](@previous)

import Foundation

/*: Cree un programa con un conjunto con el número de elementos que diga el usuario, lleno de números primos. Cree un algoritmo capaz de calcular otro conjunto de números aleatorios que tenga al menos 3 elementos en común con el conjunto inicial. */

// Must be >= 3
let numberOfElements = 8

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    if number == 2 { return true }
    if number % 2 == 0 { return false }

    let limit = Int(Double(number).squareRoot())
    if limit < 3 { return true }

    for i in 3...limit {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Generate first set with prime numbers
var primeSet: Set<Int> = []
var candidate = 2

while primeSet.count < numberOfElements {
    if isPrime(candidate) {
        primeSet.insert(candidate)
    }
    candidate += 1
}

// Generate second random set with at least 3 elements in common
var randomSet: Set<Int> = []

// Ensure at least 3 common elements
let commonElements = Array(primeSet).shuffled().prefix(3)
for element in commonElements {
    randomSet.insert(element)
}

// Add random numbers until size matches first set
while randomSet.count < numberOfElements {
    let randomNumber = Int.random(in: 1...100)
    randomSet.insert(randomNumber)
}

print("Prime Set:")
print(primeSet.sorted())

print("\nRandom Set (with at least 3 elements in common):")
print(randomSet.sorted())

let intersection = primeSet.intersection(randomSet)
print("\nCommon Elements:")
print(intersection.sorted())
print("Total common elements: \(intersection.count)")

//: [Next](@next)
