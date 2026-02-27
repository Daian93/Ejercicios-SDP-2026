//: [Previous](@previous)

import Foundation

/*: Diseña una función que, a partir de un array de números, calcule la mediana utilizando métodos funcionales para el procesamiento de datos.
 Mediana(X) =  X (n + 1 / 2) , si n es impar,
 (X n/2 + X (n/2 + 1)) / 2, si n es par. */

func mediana(_ numeros: [Double]) -> Double? {
    guard !numeros.isEmpty else { return nil }

    // Ordenamos el array de menor a mayor usando 'sorted()'.
    let ordenados = numeros.sorted()

    let n = ordenados.count
    let mitad = n / 2

    // Si el número de elementos es impar, devolvemos el del medio.
    if n % 2 != 0 {
        return ordenados[mitad]
    } else {
        // Si es par, devolvemos el promedio de los dos del medio.
        return (ordenados[mitad - 1] + ordenados[mitad]) / 2
    }
}

let numeros1 = [5.0, 3.0, 8.0, 1.0, 4.0]
let numeros2 = [7.0, 2.0, 6.0, 3.0]

print(mediana(numeros1)!)  // 4
print(mediana(numeros2)!)  // 4.5

// Una versión más funcional sería:
func medianaFuncional(_ numeros: [Double]) -> Double? {
    guard !numeros.isEmpty else { return nil }

    let ordenados = numeros.sorted()

    let n = ordenados.count

    return (n % 2 != 0)
        ? ordenados.enumerated()
            .filter { $0.offset == n / 2 }
            .map { $0.element }
            .first
        : ordenados.enumerated()
            .filter { $0.offset == n / 2 - 1 || $0.offset == n / 2 }
            .map { $0.element }
            .reduce(0, +) / 2
}

print(medianaFuncional(numeros1)!)
print(medianaFuncional(numeros2)!)

//: [Next](@next)
