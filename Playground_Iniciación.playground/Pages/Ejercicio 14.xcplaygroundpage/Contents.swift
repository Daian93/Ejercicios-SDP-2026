//: [Previous](@previous)

import Foundation

/* Create an algorithm that determines whether a number is prime or not. Note: A prime number has only two divisors: 1 and itself. */

let num: Int = 17

var isPrime = true

if num < 2 {
    isPrime = false
} else if num == 2 || num == 3 {
    isPrime = true
} else if num % 2 == 0 || num % 3 == 0 {
    isPrime = false
} else {
    var i = 5
    while i * i <= num {
        if num % i == 0 || num % (i + 2) == 0 {
            isPrime = false
            break
        }
        i += 6
    }
}

if isPrime {
    print("The number \(num) is prime.")
} else {
    print("The number \(num) is not prime.")
}

/* Another way
if num < 2 {
    isPrime = false
} else if num < 4 {
    isPrime = true   // 2 y 3 son primos
} else {
    for i in 2...Int(Double(num).squareRoot()) {
        if num % i == 0 {
            isPrime = false
            break
        }
    }
}
*/

//: [Next](@next)
