//: [Previous](@previous)

import Foundation

/*: Realice un programa que sea capaz de contar el total de números primos que haya en un array de números enteros. */

// Reusable function from exercise 1
func isPrime(_ num: Int) -> Bool {
    if num < 2 {
        return false
    } else if num == 2 || num == 3 {
        return true
    } else if num % 2 == 0 || num % 3 == 0 {
        return false
    } else {
        var i = 5
        while i * i <= num {
            if num % i == 0 || num % (i + 2) == 0 {
                return false
            }
            i += 6
        }
    }
    return true
}

func countPrimes(in array: [Int]) -> Int {
    var counter = 0

    for number in array {
        if isPrime(number) {
            counter += 1
        }
    }

    return counter
}

let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
// There are only 4 primes: 2, 3, 5 and 7
print("Total primes:", countPrimes(in: numbers))

//: [Next](@next)
