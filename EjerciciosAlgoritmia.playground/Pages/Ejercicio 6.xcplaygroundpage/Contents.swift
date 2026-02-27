//: [Previous](@previous)

import Foundation

/*: Implementa la secuencia de Fibonacci de forma recursiva, incorporando memoización para optimizar el cálculo.
 F (n) =
 1, si n = 1,
 2, si n = 2,
 F (n− 1) + F (n− 2), si n > 2. */

// Se utiliza memoización mediante un diccionario que almacena los resultados ya calculados, evitando llamadas recursivas redundantes y reduciendo la complejidad temporal de exponencial a lineal, priorizando el acceso a memoria frente al cálculo.

var contadorM = 0
var cache: [Int: Int] = [:]

@MainActor func fibonacciMemoize(_ n: Int) -> Int {
    if let resultado = cache[n] {
        return resultado
    }
    
    contadorM += 1
    
    let r: Int
    if n == 1 {
        r = 1
    } else if n == 2 {
        r = 2
    } else {
        r = fibonacciMemoize(n - 1) + fibonacciMemoize(n - 2)
    }
    
    cache[n] = r
    return r
}

let valor = fibonacciMemoize(22)

print("F(22) =", valor)
print("Número de cálculos realizados:", contadorM)
print("Valores almacenados en cache:", cache.count)

//: [Next](@next)
