//: [Previous](@previous)

import Foundation

/*: Diseña una función recursiva que, para un número dado, encuentre todos sus divisores. */

func divisoresRecursivos(de n: Int, actual i: Int = 1) -> [Int] {
    // Caso base: hemos probado todos los posibles divisores.
    if i > n {
        return []
    }

    // Si i divide a n, lo incluimos.
    if n % i == 0 {
        
        return [i] + divisoresRecursivos(de: n, actual: i + 1)
    } else {
        // [i] crea un array con el divisor encontrado, que se concatena con el resultado de las llamadas recursivas para construir el array final.
        return divisoresRecursivos(de: n, actual: i + 1)
    }
}

let resultado = divisoresRecursivos(de: 10)
print(resultado)

//: [Next](@next)
