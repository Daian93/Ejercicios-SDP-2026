//: [Previous](@previous)

import Foundation

/*: Desarrolla un algoritmo para encontrar todos los números perfectos hasta un límite dado.
 ALGORITMO: Un número perfecto es igual a la suma de sus divisores propios (excluyendo el número mismo). Por ejemplo, 6 es perfecto porque sus divisores son 1, 2 y 3, y 1 + 2 + 3 = 6. */

let limit = 10000

// Function to check if a number is perfect
func isPerfect(_ number: Int) -> Bool {
    if number < 2 { return false }

    var sum = 0
    for i in 1..<(number) {
        if number % i == 0 {
            sum += i
        }
    }
    return sum == number
}

// Find all perfect numbers up to the limit
var perfectNumbers: [Int] = []

for n in 2...limit {
    if isPerfect(n) {
        perfectNumbers.append(n)
    }
}

print("Perfect numbers up to \(limit):")
print(perfectNumbers)

//: [Next](@next)
