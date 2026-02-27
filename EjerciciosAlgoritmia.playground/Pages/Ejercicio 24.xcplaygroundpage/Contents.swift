//: [Previous](@previous)

import Foundation

/*: Desarrolla una función recursiva que genere todas las permutaciones de los elementos de un array. */

func permutaciones<T>(_ array: [T]) -> [[T]] {
    // Caso base
    if array.count <= 1 {
        return [array]
    }

    var resultado: [[T]] = []

    for i in array.indices {
        // Elegimos el elemento i
        let elemento = array[i]

        // Creamos el resto del array sin ese elemento
        var resto = array
        resto.remove(at: i)

        // Permutaciones del resto
        let permutacionesResto = permutaciones(resto)

        // Combinamos
        for perm in permutacionesResto {
            resultado.append([elemento] + perm)
        }
    }

    return resultado
}

let nums = [1, 2, 3]
let perms = permutaciones(nums)

print(perms)

//: [Next](@next)
