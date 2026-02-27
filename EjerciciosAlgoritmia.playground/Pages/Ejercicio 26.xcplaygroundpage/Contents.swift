//: [Previous](@previous)

import Foundation

/* Desarrolla una función que, dada una cuadrícula, calcule la cantidad de caminos únicos desde la esquina superior izquierda a la inferior derecha, aplicando memoización. */

func caminosUnicos(filas: Int, columnas: Int) -> Int {
    var memo: [String: Int] = [:]

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"
        if let valor = memo[key] {
            return valor
        }

        // Fuera de la cuadrícula
        if i < 0 || j < 0 {
            return 0
        }

        // Origen
        if i == 0 && j == 0 {
            return 1
        }

        let resultado = dp(i - 1, j) + dp(i, j - 1)
        memo[key] = resultado
        return resultado
    }

    return dp(filas - 1, columnas - 1)
}

let total = caminosUnicos(filas: 4, columnas: 4)
print(total)

//: [Next](@next)
