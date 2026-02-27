//: [Previous](@previous)

import Foundation

/*: Implementa el cálculo de la distancia de Levenshtein entre dos String utilizando programación dinámica recursiva.
 D (i, j ) =
 max(i, j ), si min(i, j ) = 0,
 D (i− 1, j ) + 1,
 [8pt ] min
 [6pt ]D (i, j− 1) + 1,
 , en otro caso,
 [6pt ]D (i− 1, j− 1) + δ(si, tj)
 δ(a , b) = {0, si a = b,
 1, si a ≠ b. */

/* La distancia de Levenshtein es una medida que indica cuán diferentes son dos cadenas de texto. Concretamente, es el número mínimo de operaciones necesarias para transformar una cadena en otra. Las operaciones que se permiten son la inserción, eliminación o sustitución de un carácter y cada operación cuesta 1. */
func distanciaLevenshtein(_ s: String, _ t: String) -> Int {
    let sArray = Array(s)
    let tArray = Array(t)

    // Diccionario para memoización. Guardamos los resultados de 'D(i,j)' para no recarcularlos.
    var memo: [String: Int] = [:]

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"
        if let valor = memo[key] {
            return valor
        }

        // Caso base
        if i == 0 || j == 0 {
            let resultado = max(i, j)
            memo[key] = resultado
            return resultado
        }

        // Coste de sustitución
        let coste = sArray[i - 1] == tArray[j - 1] ? 0 : 1

        let resultado = min(
            dp(i - 1, j) + 1,  // eliminación
            dp(i, j - 1) + 1,  // inserción
            dp(i - 1, j - 1) + coste  // sustitución
        )

        memo[key] = resultado
        return resultado
    }

    return dp(sArray.count, tArray.count)
}

let d1 = distanciaLevenshtein("diana", "pedro")
print(d1)

let d2 = distanciaLevenshtein("cosa", "casa")
print(d2)

//: [Next](@next)
