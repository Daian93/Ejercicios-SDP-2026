//: [Previous](@previous)

import Foundation

/*: Implementa el algoritmo de la criba de Eratóstenes de forma funcional para obtener todos los números primos hasta un límite dado.
 Sea S= {2,3,4,…, N } . Para cada p ∈ S (en orden creciente), eliminar de S los números de la forma k p, con k ≥ 2. */

/* La idea del siguiente algoritmo es que partimos de un conjunto S. Tomamos el menor número p que no ha sido eliminado. Eliminamos todos sus múltiplos kp con k ≥ 2. Repetimos ahasta que p^2 > N. Los números que quedan serán los primos. */
func cribaEratostenes(hasta n: Int) -> [Int] {
    guard n >= 2 else { return [] }

    // Conjunto inicial
    var numeros = Array(2...n)

    let limite = Int(sqrt(Double(n)))

    for p in numeros where p <= limite {
        // Eliminamos los múltiplos de p (excepto p)
        numeros = numeros.filter { $0 == p || $0 % p != 0 }
    }

    return numeros
}

let primos = cribaEratostenes(hasta: 30)
print(primos)

//: [Next](@next)
