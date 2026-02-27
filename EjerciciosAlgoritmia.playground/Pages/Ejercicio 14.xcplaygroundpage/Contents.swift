//: [Previous](@previous)

import Foundation

/*: Implementa el algoritmo Merge Sort de forma recursiva y utilizando métodos funcionales para la división y fusión de arrays.
 MergeSort(A) = {A, si | A | ≤ 1,
 [8pt ]Merge(MergeSort(A1), MergeSort(A2)), si | A |  */

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    // Caso base: los arrays de tamaño 0 o 1 ya están ordenados.
    guard array.count > 1 else { return array }

    // Dividimos el array en dos mitades.
    let mitad = array.count / 2
    let izquierda = Array(array.prefix(mitad))
    let derecha = Array(array.suffix(from: mitad))

    // Ordenamos recursivamente ambas mitades.
    let izquierdaOrdenada = mergeSort(izquierda)
    let derechaOrdenada = mergeSort(derecha)

    // Fusionamos las dos mitades ordenadas.
    return merge(izquierdaOrdenada, derechaOrdenada)
}

func merge<T: Comparable>(_ izquierda: [T], _ derecha: [T]) -> [T] {
    var resultado: [T] = []
    var i = 0
    var j = 0

    // Comparamos elementos de ambas mitades.
    while i < izquierda.count && j < derecha.count {
        if izquierda[i] <= derecha[j] {
            resultado.append(izquierda[i])
            i += 1
        } else {
            resultado.append(derecha[j])
            j += 1
        }
    }

    // Añadimos los elementos restantes.
    resultado.append(contentsOf: izquierda[i...])
    resultado.append(contentsOf: derecha[j...])

    return resultado
}

let numeros = [56, 21, 33, 2, 9, 67, 12]
let ordenados = mergeSort(numeros)
print(ordenados)

//: [Next](@next)
