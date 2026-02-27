//: [Previous](@previous)

import Foundation

/*: Crea una función recursiva que genere todas las combinaciones de los elementos de un array tomadas de k en k.
 (n
 k)= n! / k !(n− k)!. */

func combinaciones<T>(_ array: [T], k: Int) -> [[T]] {
    // Caso base: k == 0, solo una combinación vacía.
    if k == 0 {
        return [[]]
    }

    // Caso base: k mayor que el tamaño del array, ninguna combinación posible.
    if k > array.count {
        return []
    }

    // Tomamos el primer elemento.
    let primero = array[0]
    let resto = Array(array.dropFirst())

    // Combinaciones que incluyen el primer elemento.
    let conPrimero = combinaciones(resto, k: k - 1).map { [primero] + $0 }

    // Combinaciones que no incluyen el primer elemento.
    let sinPrimero = combinaciones(resto, k: k)

    // Unimos ambos casos
    return conPrimero + sinPrimero
}

let array = [1, 2, 3, 4]
let resultado = combinaciones(array, k: 2)
print(resultado)

//: [Next](@next)
