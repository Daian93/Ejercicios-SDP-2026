//: [Previous](@previous)

import Foundation

/*: Desarrolla un programa que implemente el algoritmo de criba de Eratóstenes para encontrar números primos.
 ALGORITMO: Comienza con una lista de números del 2 al límite deseado. Marca como compuesto (no primo) todos los múltiplos del primer número no marcado. Repite hasta que hayas procesado todos los números hasta la raíz cuadrada del límite. */

let limit = 50

var isPrime = Array(repeating: true, count: limit + 1)
isPrime[0] = false
isPrime[1] = false

for number in 2...Int(Double(limit).squareRoot()) {
    if isPrime[number] {
        var multiple = number * number
        while multiple <= limit {
            isPrime[multiple] = false
            multiple += number
        }
    }
}

// Collect all primes
let primes = (2...limit).filter { isPrime[$0] }

print("Prime numbers up to \(limit):")
print(primes)

//: [Next](@next)
