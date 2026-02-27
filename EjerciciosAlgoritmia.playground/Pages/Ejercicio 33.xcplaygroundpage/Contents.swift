//: [Previous](@previous)

import Foundation

/*: Escribe una función recursiva para calcular el enésimo número Catalán e ilustra su significado combinatorio.
 Cn = 1 / n + 1 (2n n )= (2n)! / (n + 1)! n! */

func catalan(_ n: Int) -> Int {
    if n == 0 { return 1 }

    return (0..<n).reduce(0) { resultado, i in
        resultado + catalan(i) * catalan(n - 1 - i)
    }
}

for i in 0...8 {
    print("C(\(i)) = \(catalan(i))")
}

// Esta versión es exponencial. Pero sería mejor utilizar la memoización:

var cacheCatalan: [Int: Int] = [:]

@MainActor func catalanMemo(_ n: Int) -> Int {
    // Si ya está calculado, lo devolvemos
    if let valor = cacheCatalan[n] {
        return valor
    }

    // Caso base
    if n == 0 {
        cacheCatalan[0] = 1
        return 1
    }

    // Cálculo recursivo
    let resultado = (0..<n).reduce(0) { acc, i in
        acc + catalanMemo(i) * catalanMemo(n - 1 - i)
    }

    // Guardamos en cache
    cacheCatalan[n] = resultado
    return resultado
}

for i in 0...6 {
    print("C(\(i)) = \(catalanMemo(i))")
}

print("Valores almacenados en cache:", cacheCatalan)

//: [Next](@next)
