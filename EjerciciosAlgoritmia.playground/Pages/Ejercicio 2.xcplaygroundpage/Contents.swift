//: [Previous](@previous)

import Foundation

/*: A partir de un array, filtra los números pares y calcula su promedio usando combinaciones de filter y reduce.*/

func promedioPares(_ numeros: [Int]) -> Double {
    let pares = numeros.filter { $0 % 2 == 0 }

    guard !pares.isEmpty else {
        return 0.0
    }

    let suma = pares.reduce(0, +)
    return Double(suma) / Double(pares.count)
}

let numeros1: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(promedioPares(numeros1))

let numeros2: [Int] = [1, 3, 5, 7, 9]
print(promedioPares(numeros2))

//: [Next](@next)
