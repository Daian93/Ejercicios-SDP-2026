//: [Previous](@previous)

import Foundation

/*: Implementa una función que, dada dos cadenas, calcule la distancia de edición (de Levenshtein) utilizando recursión con memoización.
 D (i, j ) = max(i, j ), si min(i, j ) = 0,
 [8pt ] min D (i− 1, j ) + 1,
 [6pt ]D (i, j− 1) + 1,
 [6pt ]D (i− 1, j− 1) + δ(si, tj)
 , en otro caso,
 δ(si, tj) = {0, si si = tj,
 1, si si ≠ tj. */

func distanciaLevenshtein(_ s1: String, _ s2: String) -> Int {
    let arr1 = Array(s1)
    let arr2 = Array(s2)

    var cache: [String: Int] = [:]

    func distancia(i: Int, j: Int) -> Int {
        let key = "\(i),\(j)"

        if let valor = cache[key] {
            return valor
        }

        let resultado: Int

        if i == 0 {  // Caso base: s1 vacío
            resultado = j
        } else if j == 0 {  // Caso base: s2 vacío
            resultado = i
        } else {
            let costo = arr1[i - 1] == arr2[j - 1] ? 0 : 1

            let eliminacion = distancia(i: i - 1, j: j) + 1
            let insercion = distancia(i: i, j: j - 1) + 1
            let sustitucion = distancia(i: i - 1, j: j - 1) + costo

            resultado = min(eliminacion, insercion, sustitucion)
        }

        cache[key] = resultado
        return resultado
    }

    return distancia(i: arr1.count, j: arr2.count)
}

let palabra1 = "pasa"
let palabra2 = "pala"
print("Distancia Levenshtein:", distanciaLevenshtein(palabra1, palabra2))  // 1

//: [Next](@next)
