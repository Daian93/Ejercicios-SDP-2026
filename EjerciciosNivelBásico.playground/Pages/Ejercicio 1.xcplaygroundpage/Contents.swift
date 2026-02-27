//: [Previous](@previous)

import Foundation

/*: Realice un programa que sea capaz de determinar si un número entero positivo cualquiera es un número primo o no. */

// Reusable function
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

// Principal program
var num: Int

repeat {
    print("Enter a number: ", terminator: "")
    num = Int(readLine() ?? "") ?? 1
    if num < 1 {
        print("Invalid number. Please enter a non-negative number.")
    }
} while num < 1

if isPrime(num) {
    print("The number \(num) is prime.")
} else {
    print("The number \(num) is not prime.")
}

print(isPrime(2))  // true
print(isPrime(3))  // true
print(isPrime(4))  // false

//: [Next](@next)
