//: [Previous](@previous)

import Foundation

/*: Crea un array con 15 números enteros aleatorios. Mediante bucles tradicionales, calcula la suma de los números impares y el producto de los números pares. */

var numbers: [Int] = []

for _ in 1...15 {
    numbers.append(Int.random(in: 1...100))
}

var sumOdd: Int = 0
var productEven: Int = 1

for number in numbers {
    if number.isMultiple(of: 2) {
        productEven *= number
    } else {
        sumOdd += number
    }
}

print("La suma de los números impares es: \(sumOdd)")
print("El producto de los números pares es: \(productEven)")

//: [Next](@next)
