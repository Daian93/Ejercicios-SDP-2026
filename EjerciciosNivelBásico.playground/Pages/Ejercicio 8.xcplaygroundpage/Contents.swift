//: [Previous](@previous)

import Foundation

/*: Construye un array con al menos 100 números aleatorios de entre 1 y 100 y luego filtra este para obtener como resultado solo aquellos números que son primos entre los 100 que había al principio. */

// Function to check if a number is prime used before in other exercises
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

// Create array with 100 random numbers between 1 and 100
var randomNumbers: [Int] = []

for _ in 1...100 {
    randomNumbers.append(Int.random(in: 1...100))
}

// Filter prime numbers using higher-order function
let primeNumbers = randomNumbers.filter { isPrime($0) }

print("Original array (100 random numbers):")
print(randomNumbers)

print("\nPrime numbers found:")
print(primeNumbers)

print("\nTotal primes found: \(primeNumbers.count)")

//: [Next](@next)
