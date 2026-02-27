//: [Previous](@previous)

import Foundation

/*: Realice un programa capaz de devolver el total de números de la secuencia de Fibonacci, en orden desde el primero, que el usuario pida.
 ALGORITMO: La secuencia de Fibonacci se obtiene de, a partir de los dos primeros números 1 y 2, sumar las dos posiciones anteriores de forma consecutiva para obtener el nuevo valor: 1, 2, 3, 5, 8, 13, 21… */

func fibonacci(number n: Int) {
    var a = 1
    var b = 2

    if n >= 1 { print(a) }
    if n >= 2 { print(b) }

    if n > 2 {
        for _ in 3...n {
            let c = a + b
            print(c)
            a = b
            b = c
        }
    }
}

fibonacci(number: 10)

//: [Next](@next)
