//: [Previous](@previous)

import Foundation

// Create an algorithm that prints all prime numbers less than N. We will create a function with exercise 14's solution.

let num: Int = 20

func isPrime(_ n: Int) -> Bool {
    let num: Int = n
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

for i in 1..<num {
    if (isPrime(i)) {
        print(i)
    }
}

//: [Next](@next)
