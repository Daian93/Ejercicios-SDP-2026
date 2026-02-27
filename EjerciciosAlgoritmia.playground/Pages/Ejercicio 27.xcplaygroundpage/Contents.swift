//: [Previous](@previous)

import Foundation

/* Dado un array de enteros, suma solamente los números primos utilizando
 filter y reduce. */

// Rescatamos la función 'esPrimo' que hicimos en el ejercicio 8
func esPrimo(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }
    if n == 3 { return true }

    let limite = Int(sqrt(Double(n)))
    return !(2...limite).contains { n % $0 == 0 }
}

func sumaDePrimos(_ numeros: [Int]) -> Int {
    return
        numeros
        .filter { esPrimo($0) }
        .reduce(0) { $0 + $1 }
}

let array: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
print(sumaDePrimos(array))

//: [Next](@next)
