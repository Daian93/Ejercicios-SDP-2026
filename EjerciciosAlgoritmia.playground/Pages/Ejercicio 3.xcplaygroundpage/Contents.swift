//: [Previous](@previous)

import Foundation

/*: Utiliza map para transformar un array de enteros en otro array en el que cada elemento es el factorial del número original; implementa el factorial de forma recursiva.
 n! = {1, si n = 0,
 n × (n− 1)!, si n > 0. */

// Implementamos el factorial de forma recursiva.
func factorial(_ n: Int) -> Int {
    if n == 0 {
        return 1
    } else {
        return n * factorial(n - 1)
    }
}

let numeros = [0, 1, 2, 3, 4, 5]

// Utilizamos map con el factorial para transformar cada número en su factorial correspondiente.
let factoriales = numeros.map { factorial($0) }
print(factoriales)

//: [Next](@next)
