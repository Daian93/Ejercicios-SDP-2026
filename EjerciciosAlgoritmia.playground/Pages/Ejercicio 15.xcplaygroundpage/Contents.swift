//: [Previous](@previous)

import Foundation

/*: Escribe una función que dado un array, genere el conjunto potencia (power set) usando recursión. En esencia, el conjunto potencia de S P(S) es el conjunto de todos los subconjuntos de S.
 𝒫(S ) = { X ∣ X ⊆ S } | 𝒫(S ) |= 2n. */

// El conjunto potencia se obtiene de forma recursiva calculando el conjunto potencia del conjunto sin el primer elemento y duplicando los subconjuntos al añadir dicho elemento.

func conjuntoPotencia<T>(_ array: [T]) -> [[T]] {
    // Caso base: el conjunto potencia del conjunto vacío.
    if array.isEmpty {
        return [[]]
    }

    // Tomamos el primer elemento.
    let primer = array[0]
    let resto = Array(array.dropFirst())

    // Conjunto potencia del resto.
    let subconjuntosSinPrimer = conjuntoPotencia(resto)

    // A cada subconjunto le añadimos el primer elemento.
    let subconjuntosConPrimer = subconjuntosSinPrimer.map { subconjunto in
        [primer] + subconjunto
    }

    // Unimos ambos resultados.
    return subconjuntosSinPrimer + subconjuntosConPrimer
}

let conjunto = [1, 2, 3]
let potencia = conjuntoPotencia(conjunto)
print(potencia)

//: [Next](@next)
