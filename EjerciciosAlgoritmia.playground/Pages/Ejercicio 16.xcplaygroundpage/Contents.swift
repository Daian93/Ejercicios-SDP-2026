//: [Previous](@previous)

import Foundation

/*: Desarrolla una función que genere el Triángulo de Pascal hasta N filas, haciendo uso de map y recursión. Cada elemento del triángulo está dado por el coeficiente binomial de forma que la fila n se compone de todos los coeficientes.
 (n
 k)= n! / k !(n− k)! , para 0 ≤ k ≤ n. */

func trianguloPascal(_ n: Int) -> [[Int]] {
    // Caso base
    if n == 0 {
        return []
    }
    if n == 1 {
        return [[1]]
    }

    // Llamada recursiva: triángulo hasta n-1
    let trianguloAnterior = trianguloPascal(n - 1)
    let ultimaFila = trianguloAnterior.last!

    // Construcción de la nueva fila usando map
    let filaIntermedia = (0..<(ultimaFila.count - 1)).map {
        ultimaFila[$0] + ultimaFila[$0 + 1]
    }

    let nuevaFila = [1] + filaIntermedia + [1]

    return trianguloAnterior + [nuevaFila]
}

let pascal = trianguloPascal(7)
pascal.forEach { print($0) }

//: [Next](@next)
