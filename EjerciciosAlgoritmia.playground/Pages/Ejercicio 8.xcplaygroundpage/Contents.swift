//: [Previous](@previous)

import Foundation

/*: Desarrolla una función que, dada una cantidad N, devuelva un array con los primeros N números primos usando un enfoque funcional. */

func esPrimo(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }  // 2 es primo
    if n == 3 { return true }  // 3 es primo

    let limite = Int(sqrt(Double(n)))
    return !(2...limite).contains { n % $0 == 0 }
}

func primerosPrimos(_ N: Int) -> [Int] {
    guard N > 0 else { return [] }

    var primos: [Int] = []
    var numero = 2

    while primos.count < N {
        if esPrimo(numero) {
            primos.append(numero)
        }
        numero += 1
    }

    return primos
}

let primos10 = primerosPrimos(10)
print(primos10)  // [2, 3, 5, 7, 11, 13, 17, 19, 23, 29]

//: [Next](@next)
