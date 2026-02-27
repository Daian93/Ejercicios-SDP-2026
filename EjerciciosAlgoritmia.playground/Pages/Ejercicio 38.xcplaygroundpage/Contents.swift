//: [Previous](@previous)

import Foundation

/*: Implementa el algoritmo QuickSort utilizando un enfoque puramente funcional.
 QuickSort(A) = {A, si | A | ≤ 1,
 QuickSort({x ∈ A ∣ x < p}) ∪ {p} ∪ QuickSort({x ∈ A ∣ x ≥ p}), si | A | > 1,
 El algoritmo QuickSort divide un array seleccionando un elemento pivote y partiendo el array en dos subconjuntos: los elementos menores que el pivote y los elementos mayores o iguales al pivote. Luego, aplica recursivamente el mismo proceso a cada partición y finalmente los concatena. */

func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    // Caso base: arrays vacíos o con un solo elemento ya están ordenados.
    guard array.count > 1 else {
        return array
    }

    // Elegimos el pivote (por simplicidad, el primer elemento).
    let pivote = array[0]

    // Dividimos en menores y mayores o iguales que el pivote.
    let menores = array.dropFirst().filter { $0 < pivote }
    let mayoresIguales = array.dropFirst().filter { $0 >= pivote }

    // Concatenamos la recursión de menores, el pivote y la recursión de mayores.
    return quickSort(menores) + [pivote] + quickSort(mayoresIguales)
}

let numeros = [30, 7, 56, 20, 21, 79, 2, 17]
let ordenados = quickSort(numeros)
print(ordenados)

//: [Next](@next)
